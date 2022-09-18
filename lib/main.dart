import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slookyie_max/bloc/addStaffBloc.dart';
import 'package:slookyie_max/ui/adminhome.dart';
import 'package:slookyie_max/ui/home.dart';
import 'package:slookyie_max/ui/homeServices.dart';
import 'package:slookyie_max/ui/login.dart';
import 'bloc/addServiceBloc.dart';
import 'bloc/bookingBloc.dart';
import 'bloc/loginbloc.dart';
import 'bloc/logoutBloc.dart';
import 'bloc/logoutUserBloc.dart';
import 'bloc/regBloc.dart';
import 'bloc/removeServiceBloc.dart';
import 'bloc/removeStaffBloc.dart';
import 'bloc/viewBookingBloc.dart';
import 'bloc/viewServicesBloc.dart';
import 'bloc/viewStaffBloc.dart';
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


  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<RegBloc>(create: (context) => RegBloc()),
        BlocProvider<LogOutBloc>(create: (context) => LogOutBloc()),
        BlocProvider<LogOutUserBloc>(create: (context) => LogOutUserBloc()),
        BlocProvider<RemoveServiceBloc>(create: (context) => RemoveServiceBloc()),
        BlocProvider<RemoveStaffBloc>(create: (context) => RemoveStaffBloc()),
        BlocProvider<ViewServicesBloc>(create: (context) => ViewServicesBloc()),
        BlocProvider<BookingBloc>(create: (context) => BookingBloc()),
        BlocProvider<ViewBookingBloc>(create: (context) => ViewBookingBloc()),
        BlocProvider<ViewStaffBloc>(create: (context) => ViewStaffBloc()),
        BlocProvider<AddStaffBloc>(create: (context) => AddStaffBloc()),
        BlocProvider<AddServiceBloc>(create: (context) => AddServiceBloc()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Slookyie',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: Login()),
    );
  }
}