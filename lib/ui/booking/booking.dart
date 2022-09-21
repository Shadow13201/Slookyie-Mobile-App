import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slookyie_max/bloc/bookingBloc.dart';
import 'package:slookyie_max/ui/home.dart';

import '../../bloc/viewSlotsBloc.dart';

class Booking extends StatefulWidget {
  final String serviceId;

  const Booking({Key? key, required this.serviceId}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {


  DateTime defdate = DateTime(2022, 10, 8);

  DateTime? _dateTimeon;

  void initState() {
    BlocProvider.of<ViewSlotsBloc>(context).add(CheckViewSlots());
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
          backgroundColor: Color(0xffFF0063)
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text("Select Date"),
            ElevatedButton(
              child: Text("${defdate.year}/${defdate.month}/${defdate.day}"),
              onPressed: () async{
                _dateTimeon=(await showDatePicker(
                  //currentDate: defdate,
                    context: context,
                    initialDate: defdate,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2030)
                ))!;
                //Fluttertoast.showToast(msg: defdate.toString());
                if (_dateTimeon == null) return;
                setState(() => defdate = _dateTimeon!);
              },
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
            BlocBuilder<ViewSlotsBloc, ViewSlotsState>(
              builder: (context, state) {
                if (state is ViewSlotsChecked){
                  return ListView.builder(
                    itemCount: state.viewslt!.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index){
                      return Column(
                        children: [
                          MaterialButton(
                              child: Text(state.viewslt!.data![index].slot!),
                              color: Colors.blue,
                              height: 10,
                              minWidth: 10,
                              onPressed: (){
                                var selectedslot = state.viewslt!.data![index].slot!;
                              }),
                        ],
                      );
                    },
                  );
                } else if (state is CheckingViewSlots) {
                  return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.pinkAccent,
                      ));
                } else {
                  return const Center(
                    child: Text("error"),
                  );
                }
              },
            ),
            MaterialButton(
              color: Color(0xffFF0063),
              minWidth: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 13,
              onPressed: () {
                if(_dateTimeon != null){BlocProvider.of<BookingBloc>(context).add(CheckOTP(
                    date: "${_dateTimeon!.day}/${_dateTimeon!.month}/${_dateTimeon!.year}",
                    services: widget.serviceId,
                    slot: selectedslot
                )
                );}
                else{
                  Fluttertoast.showToast(msg: "Please make changes");
                }
              },
              child: BlocConsumer<BookingBloc, BookingState>(
                  builder: (context, state) {
                if (state is CheckingOtp) {
                  return CircularProgressIndicator();
                } else {
                  return Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white,fontSize: 14),
                  );
                }
              }, listener: (context, state) {
                if (state is OtpChecked) {
                  // BlocProvider.of<ViewBookingBloc>(context)
                  //     .add(CheckViewBooking());
                  Fluttertoast.showToast(msg: "Booking successful");
                  Navigator.pop(
                      context, MaterialPageRoute(builder: (context) => Home()));
                } else {
                  Fluttertoast.showToast(
                    msg: ("Loading..."),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
