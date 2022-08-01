import 'package:flutter/material.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slookyie_max/bloc/viewStaffBloc.dart';
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
                  text: "Staffs",
                ),
                Tab(
                  text: "Services",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Column(
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
                  BottomAppBar()
                ],
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
              })
            ],
          ),
        )
    );
  }
}
