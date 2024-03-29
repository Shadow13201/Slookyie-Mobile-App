import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slookyie_max/ui/home.dart';

import '../bloc/logoutUserBloc.dart';
import '../bloc/viewSlotsBloc.dart';
import '../loadingscreen.dart';
import 'booking/booking.dart';
import 'login.dart';

class Slots extends StatefulWidget {
  const Slots({Key? key}) : super(key: key);

  @override
  State<Slots> createState() => _SlotsState();
}

class _SlotsState extends State<Slots> {
  void initState() {
    super.initState();
    BlocProvider.of<ViewSlotsBloc>(context).add(CheckViewSlots());
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
            "Available Slots",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
          ),
        ],
      ),
      body: BlocBuilder<ViewSlotsBloc, ViewSlotsState>(
          builder: (context, state) {
            if (state is ViewSlotsChecked) {
              return GridView.builder(
                //physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: state.viewslt!.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(6, 20, 6, 4),
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
                                      MediaQuery.of(context).size.height /
                                          5,
                                      width:
                                      MediaQuery.of(context).size.width / 2,
                                      child: Center(
                                        child: Text(
                                            state.viewslt!.data![index].slot!,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    );
                  });
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
          }),
      floatingActionButton: FloatingActionButton(onPressed: () {BlocProvider.of<LogOutUserBloc>(context).add(CheckLOGOUTUser());
      },
        child: BlocConsumer<LogOutUserBloc, LogOutUserState>(
          builder: (context, state) {

            return Icon(Icons.logout_rounded);

          },
          listener: (context, state) {
            if (state is LogoutUserChecked) {
              Navigator.pop(context);
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  Login()), (Route<dynamic> route) => false);
            } else if (state is LogoutUserError) {
              Navigator.pop(context);
              Fluttertoast.showToast(

                msg: state.error,
              );
            }
            else if(state is CheckingLogoutUser){
              Loading.showLoading(context);
            }
          },
        ),
      ),
    );
  }
}
