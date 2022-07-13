import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",style: TextStyle(color: Colors.black),),
      ),
      backgroundColor: Colors.black,
      body: Column(

      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Icon(Icons.account_circle_sharp),
            Spacer(),
            Icon(Icons.account_circle_sharp)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
}
