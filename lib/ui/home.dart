import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bloc/deleteBookingBloc.dart';
import '../bloc/userViewBookingBloc.dart';
import '../loadingscreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    BlocProvider.of<UserViewBookingBloc>(context).add(CheckUserViewBooking());
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
      body: BlocBuilder<UserViewBookingBloc, UserViewBookingState>(
          builder: (context, state) {
            if (state is UserViewBookingChecked) {
              return ListView.builder(
                //physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.userviewBooking!.data!.length,
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
                                  InkWell(
                                    child: Container(
                                      color: const Color(0xffFF0063),
                                      height:
                                      MediaQuery.of(context).size.height / 5,
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(state.userviewBooking!.data![index].role!,
                                                style: const TextStyle(
                                                    color: Colors.white, fontSize: 20)),
                                            SizedBox(height: 10),
                                            Text(
                                                state.userviewBooking!.data![index].date!,
                                                style: const TextStyle(
                                                    color: Colors.white, fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () async {
                                      print('tap');
                                      await showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text("Delete?"),
                                            actions: [
                                              MaterialButton(
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context);
                                                },
                                                child: Text("No"),
                                              ),
                                              MaterialButton(
                                                  onPressed: () {
                                                    BlocProvider.of<
                                                        DeleteBookingBloc>(
                                                        context)
                                                        .add(CheckDeleteBooking(
                                                        id: state.userviewBooking!.data![index].id!));
                                                  },
                                                  child: BlocConsumer<
                                                      DeleteBookingBloc,
                                                      DeleteBookingState>(
                                                    builder: (context,
                                                        state) {
                                                      return Text(
                                                        "Yes",
                                                      );
                                                    },
                                                    listener: (context,
                                                        state) {
                                                      if (state
                                                      is DeleteBookingChecked) {
                                                        BlocProvider.of<
                                                            UserViewBookingBloc>(
                                                            context)
                                                            .add(
                                                            CheckUserViewBooking());
                                                        Navigator.pop(
                                                            context);
                                                        Navigator.pop(
                                                            context);
                                                      } else if (state
                                                      is DeleteBookingError) {
                                                        Navigator.pop(
                                                            context);
                                                        Fluttertoast
                                                            .showToast(
                                                          msg: state
                                                              .error,
                                                        );
                                                      } else if (state
                                                      is CheckingDeleteBooking) {
                                                        Loading
                                                            .showLoading(
                                                            context);
                                                      }
                                                    },
                                                  ))
                                            ],
                                          ));
                                    },
                                  ),
                                ],
                              )),
                        ),
                      ],
                    );
                  });
            } else if (state is CheckingUserViewBooking) {
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
