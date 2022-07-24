import 'package:flutter/material.dart';
import 'package:slookyie_max/ui/home.dart';
import 'package:slookyie_max/ui/login.dart';
import 'package:slookyie_max/ui/userHome.dart';

class SignUP extends StatefulWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  State<SignUP> createState() => _SignUPState();
}
enum SingingCharacter { Male, Female }

SingingCharacter? _character = SingingCharacter.Male;

class _SignUPState extends State<SignUP> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var cityController = TextEditingController();
  var emailIdController = TextEditingController();
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff0063),
      body: SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(height: 80),
            Text(
              'Sign Up', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.white,fontFamily: "fontStyle"),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 20,
                ),
                Text(
                  'Name',
                  style: TextStyle(
                      color: Colors.white, fontSize: 12, fontFamily: "fontS"),
                ),
              ],
            ),
            Container(
              width: 290,
              height: 44,
              child: TextField(
                controller: nameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(

                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(5.0)),
                    gapPadding: 4.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(5.0)),
                    gapPadding: 4.0,
                  ),
                  // hintText: 'USERNAME',
                  //labelText: 'USERNAME',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            Row (
              children: [
                SizedBox(
                  width: 60,
                  height: 20,
                ),
                Text(
                  'phone number',
                  style: TextStyle(
                      color: Colors.white, fontSize: 12, fontFamily: "fontS"),
                ),
              ],
            ),
            Container(
              width: 290,
              height: 44,
              child: TextField(
                controller: phoneController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(

                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(5.0)),
                    gapPadding: 4.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(5.0)),
                    gapPadding: 4.0,
                  ),
                  // hintText: 'USERNAME',
                  //labelText: 'USERNAME',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row (
              children: [
                SizedBox(
                  width: 60,
                  height: 20,
                ),
                Text(
                  'City',
                  style: TextStyle(
                      color: Colors.white, fontSize: 12, fontFamily: "fontS"),
                ),
              ],
            ),
            Container(
              width: 290,
              height: 44,
              child: TextField(
                controller: cityController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(

                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(5.0)),
                    gapPadding: 4.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(5.0)),
                    gapPadding: 4.0,
                  ),
                  // hintText: 'USERNAME',
                  //labelText: 'USERNAME',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 20,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                      color: Colors.white, fontSize: 12, fontFamily: "fontS"),
                ),
              ],
            ),
            Container(
              width: 290,
              height: 44,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(

                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(5.0)),
                    gapPadding: 4.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(5.0)),
                    gapPadding: 4.0,
                  ),
                  // hintText: 'USERNAME',
                  //labelText: 'USERNAME',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),


            Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 20,
                ),
                Text(
                  'password',
                  style: TextStyle(
                      color: Colors.white, fontSize: 12, fontFamily: "fontS"),
                ),
              ],
            ),
            Container(
              width: 290,
              height: 44,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(

                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(5.0)),
                    gapPadding: 4.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(5.0)),
                    gapPadding: 4.0,
                  ),
                  // hintText: 'USERNAME',
                  //labelText: 'USERNAME',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // Row(
            //     children: [
            //       SizedBox(
            //         width: 60,
            //         height: 20,
            //       ),
                  Container(
                      height: 80,
                      child: Row(children: [
                        Text(
                          "Gender:",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Row(children: [
                          Radio<SingingCharacter>(
                            activeColor: Color(0xffff0063),
                            value: SingingCharacter.Male,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              gender = "Male";
                              // setState(() {
                              //   _character = value;
                              // });
                            },
                          ),
                          Text('Male'),
                        ]),
                        Row(children: [
                          Radio<SingingCharacter>(
                            activeColor: Color(0xffff0063),
                            value: SingingCharacter.Female,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              gender = "Female";
                              // setState(() {
                              //   _character = value;
                              // });
                            },
                          ),
                          Text('Female'),
                        ])
                      ])),


            SizedBox(
              height: 40,
              width: 40,
            ),

            Container(
              width: 290,
              height: 44,
              child: MaterialButton(
                color: Color(0xffFFFFFF),
                height: 10,
                minWidth: MediaQuery.of(context).size.width*.36,
                // minWidth:MediaQuery.of(context).size.height*.36,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                },
                child: Text("Sign Up",style: TextStyle(color: Color(0XFFff0063),),
                ),
              ),
                ),
             ] ),
            ),
      );
  }
}
