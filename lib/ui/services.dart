import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slookyie_max/ui/userHome.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffFF0063),
        title: Text("Slookiye",style: TextStyle(color: Colors.white,fontSize: 18),),
        elevation: 0,
       actions: <Widget> [ IconButton(icon: Icon(Icons.search),
       // SvgPicture.asset("assets/cart.svg"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserHome()));
                },
        ),
       ],
      ),
      body:
      //   Container(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         //Padding(padding: EdgeInsets.symmetric(horizontal: 19)),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //             children: [
    //               Container(
    //                 padding: EdgeInsets.all(2),
    //                 height: 180,
    //                 width: 180,
    //                 decoration: BoxDecoration(
    //                        color: Color(0xffFF0063),
    // ),
    //                 child: Image.asset("assets/icon.png"),
    //               ),
    //               Text("Hair styling",style: TextStyle(fontSize: 18),)
    //             ],
    //           ),
    //         ),
    //
    //
    //       ],
    //     ),
    //   ),
      GridView.builder(
        //physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,childAspectRatio: 0.9,
          ),
          itemCount: 14,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Column(
                children: [
                  //Image(image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Chandanappally_Valiyapally.jpg/1200px-Chandanappally_Valiyapally.jpg"),fit: BoxFit.fill,),
                  Padding(

                    padding: const EdgeInsets.fromLTRB(2, 9.0, 3.5, 3.8),
                    child: Card(

                        child: Column(

                          children: [
                            Padding(padding: const EdgeInsets.all(7)),

                            Container(

                            height:MediaQuery.of(context).size.height/6 ,
                            width:MediaQuery.of(context).size.width/2 ,
                            child: Image.asset("assets/icon.png"),
                            //child:Image(image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Chandanappally_Valiyapally.jpg/1200px-Chandanappally_Valiyapally.jpg"),fit: BoxFit.cover,)

                    ),
                            Text("Hair Styling")
                          ],
                        )
                    ),
                  ),
                ],
              ),

            );
          }
      ),
    );
  }
}
