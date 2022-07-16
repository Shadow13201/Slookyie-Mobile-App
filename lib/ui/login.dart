import 'package:flutter/material.dart';
import 'package:slookyie_max/ui/home.dart';
import 'package:slookyie_max/ui/signUp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF0063),
        body: Container(
         height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
          // alignment: Alignment(0.0, 2.5),
          // child: CircleAvatar(
          //   backgroundColor: Color(0xff6998AB),
          //   // child: Icon(
          //   //   Icons.person,
          //   //   size: 80,
          //   // ),
          //   backgroundImage: AssetImage("assets/icon.png"),
          //   radius: 70.0,
          // ),
     //       decoration: new BoxDecoration(
     //              image: new DecorationImage(
     //              image: ExactAssetImage('assets/icon.png',),
     //              fit: BoxFit.fitHeight,
     //            ),
     // ),

          child: SingleChildScrollView(
            child: Column(
              children: [
              SizedBox(height: 160),
                Text(
                  'SLOOKYIE ' ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 55,
                      color: Colors.white,fontFamily: "fontStyle"
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Saloon Booking  ' ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,fontFamily: "fontStyle"
                  ),
                ),

        SizedBox(height: 120),
        Text(
            'Please login to Continue',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: "fontStyle"),
        ),
        Row(
            children: [
              SizedBox(
                width: 60,
                height: 20,
              ),
              Text(
                'Username',
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.white, fontSize: 9, fontFamily: "fontS"),
              ),
            ],
        ),
        Container(
            width: 290,
            height: 44,
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                //suffixIcon: Image.asset("assets/tick.png"),
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

              ),
            ),
        ),
        SizedBox(
            height: 10,
        ),
        Row(
            children: [
              SizedBox(
                width: 60,
                height: 20,
              ),
              Text(
                'Password',
                style: TextStyle(
                    color: Colors.white, fontSize: 9, fontFamily: "fontS"),
              ),
            ],
        ),
                Container(
                  width: 290,
                  height: 44,
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      //suffixIcon: Image.asset("assets/eye.png"),
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
                  height: 20,
                ),
                  Container(
                  width: 290,
    height: 44,
    child: MaterialButton(
        color: Colors.white,
      height: 10,
      minWidth: MediaQuery.of(context).size.width*.36,
      // minWidth:MediaQuery.of(context).size.height*.36,
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
    },
      child: Text("Login",style: TextStyle(color: Color(0XFFff0063)),),
    ),),
            SizedBox(
              height: 20,
            ),
                Text("Don't have an account ?",style: TextStyle(color: Colors.white,),),
                SizedBox(
                  height: 20,
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUP()));
                    },
                    child: Text("Sign Up",style: TextStyle(color: Color(0XFFff0063),),
                  ),),

                ),

              ]
          ),)
          ),

    );
  }
}
