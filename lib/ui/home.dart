import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slookyie_max/ui/staffselect.dart';

import '../bloc/viewServicesBloc.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime date = DateTime(2022, 10, 8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF0063),
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.greenAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ViewServicesBloc, ViewServicesState>(
                builder: (context, state) {
              if (state is ViewServicesChecked) {
                return ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.view!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5,
                        child: InkWell(
                          onTap: () async {
                            DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2030));
                            if (newDate == null) return;
                            setState(() => date = newDate);
                          },
                          child: Card(
                            color: Colors.purple,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/max2.png"),
                                          fit: BoxFit.fitHeight)),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text(state.view!.data![index].service!,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else if (state is ViewServicesError) {
                return Center(
                  child: Text(state.error),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.pinkAccent,
                  ),
                );
              }
            })
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 13,
          child: Row(
            children: [
              Icon(Icons.account_circle_sharp),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
                child: CircleAvatar(child: Icon(Icons.account_circle_sharp)),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.purple,
        ),
      ),
    );
  }
}
