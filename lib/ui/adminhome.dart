import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slookyie_max/bloc/viewStaffBloc.dart';
import 'package:slookyie_max/ui/addStaff.dart';
import 'package:slookyie_max/ui/login.dart';
import '../bloc/logoutBloc.dart';
import '../bloc/viewServicesBloc.dart';
import '../loadingscreen.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  void initState() {
    super.initState();
    BlocProvider.of<ViewServicesBloc>(context).add(CheckViewServices());
    BlocProvider.of<ViewStaffBloc>(context).add(CheckViewStaff());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Admin Home"),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
            actions: [],
            backgroundColor: Color(0xffFF0063),
            bottom: TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  child: Text("Staff",style: TextStyle(color: Colors.white),),
                ),
                Tab(
                  child: Text("Services",style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    BlocBuilder<ViewStaffBloc, ViewStaffState>(
                        builder: (context, state) {
                      if (state is ViewStaffChecked) {
                        return GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.9,
                            ),
                            itemCount: state.viewstaff!.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
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
                                              MediaQuery.of(context).size.width /
                                                  2,
                                              child: Center(
                                                child: Text(
                                                    state.viewstaff!.data![index].staff!,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20)),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ],
                              );
                            });
                      } else if (state is CheckingViewServices) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: Colors.pinkAccent,
                        ));
                      } else {
                        return const Center(
                          child: Text("Loading..."),
                        );
                      }
                    }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/14,
                    ),
                  ],
                ),
              ),
              BlocBuilder<ViewServicesBloc, ViewServicesState>(
                  builder: (context, state) {
                if (state is ViewServicesChecked) {
                  return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: state.view!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
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
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Center(
                                          child: Text(
                                              state.view!.data![index].service!,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20)),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        );
                      });
                } else if (state is CheckingViewServices) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.pinkAccent,
                  ));
                } else {
                  return const Center(
                    child: Text("Loading..."),
                  );
                }
              }),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            children: [
              SpeedDialChild(
                child: Icon(Icons.add),
                label: "Service",
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> AddStaff())),
              ),
              SpeedDialChild(
                child: Icon(Icons.add),
                label: "Staff",
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> AddStaff())),
              )
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            color: Color(0xffFF0063),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/12,
              child: Row(
                children: [
                  Spacer(),
                  MaterialButton(
                    color: Color(0xffFF0063),
                    onPressed: (){
                      BlocProvider.of<LogOutBloc>(context).add(CheckLOGOUT());
                    },
                    child: BlocConsumer<LogOutBloc, LogOutState>(
                      builder: (context, state) {

                        return Text(
                          "Logout",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        );

                      },
                      listener: (context, state) {
                        if (state is LogoutChecked) {
                          Navigator.pop(context);
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                              Login()), (Route<dynamic> route) => false);
                        } else if (state is LogoutError) {
                          Navigator.pop(context);
                          Fluttertoast.showToast(

                            msg: state.error,
                          );
                        }
                        else if(state is CheckingLogout){
                          Loading.showLoading(context);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
