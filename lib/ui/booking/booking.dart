import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slookyie_max/bloc/bookingBloc.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  var startcontroller = TextEditingController();
  var endcontroller = TextEditingController();
  var datecontroller = TextEditingController();

  TimeOfDay start = TimeOfDay(hour: 10, minute: 10);
  TimeOfDay end = TimeOfDay(hour: 10, minute: 10);
  DateTime defdate = DateTime(2022, 10, 8);
  String? bdate;

  DateTime? _dateTimeto;
  DateTime? _dateTimefrom;
  DateTime? _dateTimeon;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text("Select Date "),
            ElevatedButton(
              child: Text("${defdate.year}/${defdate.month}/${defdate.day}"),
              onPressed: () async {
                await showDatePicker(
                    context: context,
                    initialDate: defdate,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2030));
                if (_dateTimeon == null) return;
                setState(() => defdate = _dateTimeon!);
              },
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Text("Select Time"),
            Row(
              children: [
                Text("From"),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  child: Text("${start.hour}:${start.minute}"),
                  onPressed: () async {
                    await showTimePicker(
                        context: context, initialTime: start);
                    if (_dateTimefrom == null) return;
                    setState(() => start = _dateTimefrom as TimeOfDay);
                  },
                ),
                Spacer(),
                Text("To"),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  child: Text("${end.hour}:${end.minute}"),
                  onPressed: () async {
                    await showTimePicker(
                        context: context, initialTime: end);
                    if (_dateTimeto == null) return;
                    setState(() => end = _dateTimeto as TimeOfDay);
                  },
                ),
              ],
            ),
            Spacer(),
            MaterialButton(
              child: Text("Confirm"),
              onPressed: () {
                BlocProvider.of<BookingBloc>(context).add(CheckOTP(
                    start: _dateTimefrom.toString(),
                    end: _dateTimeto.toString(),
                    date: _dateTimeon.toString(),
                    services: ''));
              },
            )
          ],
        ),
      ),
    );
  }
}
