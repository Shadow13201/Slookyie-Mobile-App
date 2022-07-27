import 'package:flutter/material.dart';

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
  DateTime date = DateTime(2022, 10, 8);

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
              child: Text("${date.year}/${date.month}/${date.day}"),
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2030));
                if (newDate == null) return;
                setState(() => date = newDate);
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
                  onPressed: () async{
                    TimeOfDay? newTime = await showTimePicker(
                        context: context,
                        initialTime: start);
                    if(newTime == null) return;
                    setState(()=> start =newTime);
                  },
                ),
                Spacer(),
                Text("To"),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  child: Text("${end.hour}:${end.minute}"),
                  onPressed: () async{
                    TimeOfDay? newTime = await showTimePicker(
                        context: context,
                        initialTime: end);
                    if(newTime == null) return;
                    setState(()=> end =newTime);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
