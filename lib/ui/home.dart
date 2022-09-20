import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slookyie_max/bloc/viewBookingBloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    BlocProvider.of<ViewBookingBloc>(context).add(CheckViewBooking());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: OutDrawer().build(context, setState),
      appBar: AppBar(
        backgroundColor: const Color(0xffFF0063),
        title: Center(
          child: const Text(
            "BOOKINGS",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<ViewBookingBloc, ViewBookingState>(
          builder: (context, state) {
            if (state is ViewBookingChecked) {
              return ListView.builder(
                //physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.viewBooking!.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              color: Colors.white70,
                              elevation: 15,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    color: const Color(0xffFF0063),
                                    height:
                                    MediaQuery.of(context).size.height / 5,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(state.viewBooking!.data![index].role!,
                                              style: const TextStyle(
                                                  color: Colors.white, fontSize: 20)),
                                          SizedBox(height: 10),
                                          Text(
                                              state.viewBooking!.data![index].date!,
                                              style: const TextStyle(
                                                  color: Colors.white, fontSize: 14)),
                                          SizedBox(height: 10),
                                          // Spacer(),
                                          Text(
                                              state.viewBooking!.data![index].time!.start!,
                                              style: const TextStyle(
                                                  color: Colors.white, fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    );
                  });
            } else if (state is CheckingViewBooking) {
              return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.pinkAccent,
                  ));
            } else {
              return const Center(
                child: Text("error"),
              );
            }
          }),
    );
  }
}
