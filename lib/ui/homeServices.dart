import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slookyie_max/bloc/viewServicesBloc.dart';
import 'package:slookyie_max/ui/userHome.dart';

import 'booking.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  void initState() {

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //drawer: OutDrawer().build(context, setState),
      appBar: AppBar(backgroundColor: Color(0xffFF0063),
        title: Text("Slookiye",style: TextStyle(color: Colors.white,fontSize: 18),),
        elevation: 0,
        actions: <Widget> [ IconButton(icon: Icon(Icons.search),

          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UserHome()));
          },
        ),
        ],
      ),
      body:BlocBuilder<ViewServicesBloc, ViewServicesState>(builder: (context, state) {
        if (state is ViewServicesChecked) {
          return GridView.builder(
            //physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.9,
              ),
              itemCount: 14,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            Booking()));
                  },
                  child: Column(
                    children: [

                      Padding(

                        padding: const EdgeInsets.fromLTRB(6, 20, 6, 4),
                        child: Card(
                            color: Colors.white70,
                            elevation: 15,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20)),
                            ),

                            child: Column(

                              children: [
                                Container(
                                  color: Color(0xffFF0063),
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 5,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 2,
                                  child: Center(
                                    child: Text(
                                        state.view!.data![index].service!,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10)),


                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    ],
                  ),

                );
              }
          );
        }
        else if (state is ViewServicesError) {
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
      } ),
    );
  }
}
