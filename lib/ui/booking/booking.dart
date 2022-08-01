import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slookyie_max/bloc/bookingBloc.dart';
import 'package:slookyie_max/ui/home.dart';

class Booking extends StatefulWidget {
  final String serviceId;

  const Booking({Key? key, required this.serviceId}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  // var _dateTimefrom = TextEditingController();
  // var _dateTimeto = TextEditingController();
  // var _dateTimeon = TextEditingController();

  TimeOfDay start = TimeOfDay(hour: 10, minute: 10);
  TimeOfDay end = TimeOfDay(hour: 10, minute: 10);
  DateTime defdate = DateTime(2022, 10, 8);

  TimeOfDay? _dateTimeto;
  TimeOfDay? _dateTimefrom;
  DateTime? _dateTimeon;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
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
            Text("Select Time"),
            Row(
              children: [
                Text("From"),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  child: Text("${start.hour}:${start.minute}"),
                  onPressed: () async {
                    _dateTimefrom=await showTimePicker(context: context, initialTime: start);
                    if (_dateTimefrom == null) return;
                    else{
                      setState(() => start = _dateTimefrom as TimeOfDay);
                    }
                  },
                ),
                Spacer(),
                Text("To"),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  child: Text("${end.hour}:${end.minute}"),
                  onPressed: () async {
                    _dateTimeto=await showTimePicker(context: context, initialTime: end);
                    if (_dateTimeto == null) return;
                    else{
                      setState(() => end = _dateTimeto as TimeOfDay);
                    }
                  },
                ),
              ],
            ),
            Spacer(),
            MaterialButton(
              color: Colors.purple,
              minWidth: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 13,
              onPressed: () {
                if(_dateTimefrom!= null && _dateTimeto !=null && _dateTimeon != null){BlocProvider.of<BookingBloc>(context).add(CheckOTP(
                    start: "${_dateTimefrom!.hour}:${_dateTimefrom!.minute}",
                    end: "${_dateTimeto!.hour}:${_dateTimeto!.minute}",
                    date: "${_dateTimeon!.day}/${_dateTimeon!.month}/${_dateTimeon!.year}",
                    services: widget.serviceId
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
                    msg: ("Melbin's Dad"),
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
