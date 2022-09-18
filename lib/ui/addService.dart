import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slookyie_max/ui/adminhome.dart';

import '../bloc/addServiceBloc.dart';

class AddService extends StatefulWidget {
  const AddService({Key? key}) : super(key: key);

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  var serviceController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    setState(() {

    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff0063),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
              children: [
                SizedBox(height: 80),
                Text(
                  'Add Service', textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30,
                      color: Colors.white,
                      fontFamily: "fontStyle"),
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
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: "fontS"),
                    ),
                  ],
                ),
                Container(
                  width: 290,
                  height: 44,
                  child: TextFormField(
                    controller: serviceController,
                    keyboardType: TextInputType.text,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                MaterialButton(
                    onPressed: () =>
                    {
                      BlocProvider.of<AddServiceBloc>(context).add(
                          CheckAddService(
                            service: serviceController.text,
                          )
                      )
                    },
                    height: 30,
                    minWidth: MediaQuery.of(context).size.width * .36,

                    color: Color(0xffFFFFFF),
                    child: Title(
                      color: Color(0XFFff0063),
                      child: BlocConsumer<AddServiceBloc, AddServiceState>(
                        builder: (context, state) {
                          if (state is CheckingAddService) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          } else {
                            return Center(
                                child: Text("Register", style: TextStyle(color: Color(0XFFff0063)),
                                ));
                          }
                        },
                        listener: (context, state) {
                          if (state is AddServiceChecked) {
                            Fluttertoast.showToast(
                                msg: "New service added successfully");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome()));
                          }
                          else if (state is AddServiceError) {
                            Fluttertoast.showToast(msg: state.error);
                          }
                        },
                      ),
                    )),
              ]),
        ),
      ),
    );
  }
}
