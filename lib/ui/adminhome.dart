import 'package:flutter/material.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:slookyie_max/ui/profile.dart';
class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar:AppBar(
            title: Text("Admin Home"),titleTextStyle: TextStyle(color: Colors.black,fontSize: 24),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              ),
            ],
            backgroundColor: Color(0xffFFD233),bottom: TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: [
              Tab(text: "Staffs",),
              Tab(text: "Services",),
            ],),
          ),
          body: TabBarView(children: [
            GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                childAspectRatio: 0.59),
                itemCount: 10 ,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return Column(
                    children: [
                      Expanded(child: Card(
                        color:Color(0xffE5E5E5),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child:Row(
                                children: [
                                  Text('Olivia',overflow: TextOverflow.fade,maxLines: 1, style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.black),
                            AvatarView(
                              radius: 60,
                              borderColor: Color((0xffE5E5E5)),
                              isOnlyText: false,
                              text: Text('Somaraj', style: TextStyle(color: Color((0xffE5E5E5)), fontSize: 50),),
                              avatarType: AvatarType.CIRCLE,
                              backgroundColor: Color((0xffE5E5E5)),
                              imagePath: "assets/max.png",
                            ),
                          ],
                        ),
                      )
                      )
                    ],
                  );
                }),
            ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/5,
                    child: InkWell(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>Profile())),
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
        )
    );
  }
}
