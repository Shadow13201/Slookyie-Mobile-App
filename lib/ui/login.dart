import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slookyie_max/ui/booking/booking.dart';
import 'package:slookyie_max/ui/homeServices.dart';
import 'package:slookyie_max/ui/registration.dart';

// import 'package:slookyie_max/ui/signUp.dart';
import '../bloc/loginbloc.dart';
import '../helper/sharedpreferences.dart';
import 'package:flutter/src/widgets/navigator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _isObscure = true;

  // @override
  var token = null;

  void initState() {
    super.initState();
  }

  initFunc() async {
    token = await TempStorage.getToken();
  }

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
            child: Column(children: [
              const SizedBox(height: 160),
              const Text(
                'SLOOKYIE ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 55, color: Colors.white, fontFamily: "fontStyle"),
              ),
              const SizedBox(height: 10),
              const Text(
                'Saloon Booking  ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20, color: Colors.white, fontFamily: "fontStyle"),
              ),
              const SizedBox(height: 120),
              const Text(
                'Please login to Continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontFamily: "fontStyle"),
              ),
              Row(
                children: const [
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
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    //suffixIcon: Image.asset("assets/tick.png"),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      gapPadding: 4.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      gapPadding: 4.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
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
                  controller: passwordController,
                  obscureText: _isObscure,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.white, width: 2.0),
                      borderRadius:
                          BorderRadius.all(Radius.circular(5.0)),
                      gapPadding: 4.0,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.white, width: 2.0),
                      borderRadius:
                          BorderRadius.all(Radius.circular(5.0)),
                      gapPadding: 4.0,
                    ),
                    // hintText: 'USERNAME',
                    //labelText: 'USERNAME',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 290,
                height: 44,
                child: MaterialButton(
                  color: Colors.white,
                  height: 10,
                  minWidth: MediaQuery.of(context).size.width * .36,
                  // minWidth:MediaQuery.of(context).size.height*.36,
                  onPressed: () {
                    // Navigator.push(context,
                    //           MaterialPageRoute(builder: (context) => Services()));
                    BlocProvider.of<AuthBloc>(context).add(
                        CheckOTP(
                      email: emailController.text,
                      password: passwordController.text,
                    ));
                    // if(emailController.text=="seb@gmail.com"){
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => Services()));
                    // }
                    // else{
                    //   Fluttertoast.showToast(msg: "Invalid");
                    // }
                  },
                  child: BlocConsumer<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if(state is CheckingOtp){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      else{
                        return Text("Log in");
                      }
                    },
                    listener: (context,state){
                      if(state is OtpChecked){
                        Fluttertoast.showToast(msg: "Logged in");
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Services()),
                                (Route<dynamic> route) => false);
                      }
                      else if (state is OtpError){
                        Fluttertoast.showToast(msg: state.error);
                      }
                    }
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Don't have an account ?",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 290,
                height: 44,
                child: MaterialButton(
                  color: const Color(0xffFFFFFF),
                  height: 10,
                  minWidth: MediaQuery.of(context).size.width * .36,
                  // minWidth:MediaQuery.of(context).size.height*.36,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUP()));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Color(0XFFff0063),
                    ),
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}
