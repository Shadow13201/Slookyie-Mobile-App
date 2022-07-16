import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontWeight: FontWeight.w800)),
        backgroundColor: Color(0xffFF0063),
      ),
      body: SafeArea(
        child: Column(children: [
          Container(

            width: double.infinity,
            height: 180,
            child: Container(
              alignment: Alignment(0.0, 2.5),
              child: CircleAvatar(
                backgroundColor: Color(0xffFF0063),
                // child: Icon(
                //   Icons.person,
                //   size: 80,
                // ),
                backgroundImage: AssetImage("assets/icon.png"),
                radius: 70.0,
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Row(
            children: [
              Center(
                child:
                Container(height: 30, width: 40, child: Icon(Icons.person)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 12.0, color: Colors.blueGrey,
                          //letterSpacing: 2.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 20,
                      ),
                      Text("ABCD",
                        style: TextStyle(
                          fontSize: 22.0, color: Color(0xffFF0063),
                          //letterSpacing: 2.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Center(
                child:
                Container(height: 30, width: 40, child: Icon(Icons.email_outlined)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Text(
                        "Email Address",
                        style: TextStyle(
                          fontSize: 12.0, color: Colors.blueGrey,
                          //letterSpacing: 2.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 20,
                      ),
                      Text(
                        "abcd@gmail.com",
                        style: TextStyle(
                          fontSize: 22.0, color: Color(0xffFF0063),
                          // letterSpacing: 2.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Center(
                child: Container(
                    height: 30,
                    width: 40,
                    child: Icon(Icons.house)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Text(
                        "Address",
                        style: TextStyle(
                          fontSize: 12.0, color: Colors.blueGrey,
                          //letterSpacing: 2.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 20,
                      ),
                      Text(
                        "Kottayam",
                        style: TextStyle(
                          fontSize: 22.0, color: Color(0xffFF0063),
                          //letterSpacing: 2.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Center(
                child:
                Container(height: 30, width: 40, child: Icon(Icons.phone)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Text(
                        "Phone Number",
                        style: TextStyle(
                          fontSize: 12.0, color: Colors.blueGrey,
                          //letterSpacing: 2.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 20,
                      ),
                      Text(
                        "987657892",
                        style: TextStyle(
                          fontSize: 22.0, color: Color(0xffFF0063),
                          //letterSpacing: 2.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
          SizedBox(
            width: 10,
            height: 20,
          ),

        ]),),);
  }
}
