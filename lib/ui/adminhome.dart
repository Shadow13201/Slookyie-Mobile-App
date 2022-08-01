import 'package:flutter/material.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slookyie_max/bloc/viewStaffBloc.dart';
import '../bloc/viewServicesBloc.dart';

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
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              ),
            ],
            backgroundColor: Color(0xffFFD233),
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
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 0.59),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Expanded(
                            child: Card(
                          color: Color(0xffE5E5E5),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Row(
                                  children: [
                                    Text('Olivia',
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.more_vert),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(color: Colors.black),
                              AvatarView(
                                radius: 60,
                                borderColor: Color((0xffE5E5E5)),
                                isOnlyText: false,
                                text: Text(
                                  'Somaraj',
                                  style: TextStyle(
                                      color: Color((0xffE5E5E5)), fontSize: 50),
                                ),
                                avatarType: AvatarType.CIRCLE,
                                backgroundColor: Color(0xffE5E5E5),
                                imagePath: "assets/max.png",
                              ),
                            ],
                          ),
                        ))
                      ],
                    );
                  }),
              BlocBuilder<ViewServicesBloc, ViewServicesState>(
                  builder: (context, state) {
                    if (state is ViewServicesChecked) {
                      return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.9,
                          ),
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      6, 20, 6, 4),
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
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .height / 5,
                                            width:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .width / 2,
                                            child: Center(
                                              child: Text("",
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
                        child: Text("error"),
                      );
                    }
                  })
            ],
          ),
        ));
  }
}
