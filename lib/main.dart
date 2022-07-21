import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slookyie_max/ui/adminhome.dart';
import 'package:slookyie_max/ui/home.dart';
import 'package:slookyie_max/ui/login.dart';
import 'bloc/loginbloc.dart';
import 'bloc/logoutbloc.dart';
import 'helper/sharedpreferences.dart';

void main() => runApp(const AppHome());

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  var token, role;

  void initState() {

    super.initState();
  }

  getrole() async {
    await first();
  }

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<LogBloc>(create: (context) => LogBloc()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'periyar',
          theme: ThemeData(
            primarySwatch: Colors.yellow,
          ),
          home: NewHome()),
    );
  }


  first() async {
    token = await TempStorage.getToken();
    role = await TempStorage.getRole();
    if (token != null) {
      if (role == "User") {
        return Home();
      } else if (role == "Admin") {
        return AdminHome();
      }
    } else if (token == null) {
      return Login();
    }
  }
}


class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  @override
  void initState() {

    BlocProvider.of<LogBloc>(context).add(CheckAuth());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocListener<LogBloc,LogState>(
        listener: (context,state){
          if(state is AuthConfirmed){
            if (state.role == "User") {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  Home()), (Route<dynamic> route) => false);
            } else if (state.role == "Admin") {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  AdminHome()), (Route<dynamic> route) => false);
            }
          }
          else{
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                Login()), (Route<dynamic> route) => false);
          }
        },
        child: Container(),
      ),
    );
  }
}