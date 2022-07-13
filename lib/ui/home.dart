import 'package:flutter/material.dart';
import 'package:slookyie_max/ui/staffselect.dart';
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
        backgroundColor: Colors.white,
        title: Text("Home",style: TextStyle(color: Colors.black),),
      ),
      backgroundColor: Colors.greenAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index){
                return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/5,
                  child: InkWell(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>StaffSelect())),
                    child: Card(
                      color: Colors.purple,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/max2.png"),
                                    fit: BoxFit.fitHeight
                                )
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text("Cutting",style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.bold)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/13,
          child: Row(
            children: [
              Icon(Icons.account_circle_sharp),
              Spacer(),
              Icon(Icons.account_circle_sharp)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){},
        child: Icon(Icons.add,color: Colors.purple,),
      ),
    );
  }
}
