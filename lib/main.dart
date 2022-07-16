import 'package:flutter/material.dart';
import 'package:slookyie_max/ui/adminhome.dart';
import 'package:slookyie_max/ui/home.dart';
import 'package:slookyie_max/ui/login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const Login(),

      //home: const AdminHome(),

    );
  }
}