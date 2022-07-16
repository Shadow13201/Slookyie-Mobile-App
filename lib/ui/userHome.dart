import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:slookyie_max/ui/services.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slookyie",style: TextStyle(fontSize: 25,color: Colors.white),),
        backgroundColor: Color(0xffFF0063),
      ),
      body:  Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    services_bubbles(context),
                    services_bubbles(context),
                    services_bubbles(context),
                    services_bubbles(context),
                    services_bubbles(context),
                    services_bubbles(context),
                    services_bubbles(context),
                    services_bubbles(context),
                    services_bubbles(context),
                    services_bubbles(context),
                    services_bubbles(context),
                    services_bubbles(context),
                  ],
                ),
              ),

               gender(context),
            ],
          ),

        ),


    );
  }
}
Widget services_bubbles(BuildContext context) {
  return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         children: [
           Container(
             width: 80,
             height: 80,
             decoration: BoxDecoration(
               shape: BoxShape.circle,
               color: Color(0xff66BFBF),
             ),
           ),
           SizedBox(
             height: 10,
           ),
           Text("Bridal"),
         ],
       ),
  );

}

Widget gender(BuildContext context){
  return Container(
    child: (
        Column(children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute (builder:(context)=>Services()));},

              child: Card(
                elevation: 10,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Container(
                  child:(
                      Text("Men",style: TextStyle(fontSize: 25, fontFamily: "fontstyle" ,))),
                  color: Color(0xff66BFBF),
                  height: MediaQuery.of(context).size.height*0.27,
                  width: MediaQuery.of(context).size.width,


                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute (builder:(context)=>Services()));},

              child: Card(
                elevation: 10,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Container(
                  child:(
                      Text("Women",style: TextStyle(fontSize: 25, fontFamily: "fontstyle" ,))),
                  color: Color(0xff66BFBF),
                  height: MediaQuery.of(context).size.height*0.27,
                  width: MediaQuery.of(context).size.width,


                ),
              ),
            ),
          ),
        ],)
    ),
  );
}
