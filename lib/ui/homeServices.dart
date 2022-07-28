import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slookyie_max/bloc/viewServicesBloc.dart';
import 'package:slookyie_max/ui/userHome.dart';

import 'booking.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  void initState() {
    super.initState();
    BlocProvider.of<ViewServicesBloc>(context).add(CheckViewServices());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: OutDrawer().build(context, setState),
      appBar: AppBar(
        backgroundColor: const Color(0xffFF0063),
        title: Center(
          child: const Text(
            "SERVICES",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserHome()));
            },
          ),
        ],
      ),
      body: BlocBuilder<ViewServicesBloc, ViewServicesState>(
          builder: (context, state) {
        if (state is ViewServicesChecked) {
          return GridView.builder(
              //physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
              ),
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Booking()));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(6, 20, 6, 4),
                        child: Card(
                            color: Colors.white70,
                            elevation: 15,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  color: const Color(0xffFF0063),
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Center(
                                    child: Text(
                                        state.view!.data![index].service!,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                );
              });
        } else if (state is CheckingViewServices) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.pinkAccent,
          ));
        } else {
          return const Center(
            child: Text("error"),
          );
        }
      }),
    );
  }
}
