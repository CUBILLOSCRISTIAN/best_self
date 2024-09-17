import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: CalendarTimeline(
        initialDate: DateTime.now(),
        firstDate: DateTime(2024, 1, 15),
        lastDate: DateTime(2024, 12, 20),
        onDateSelected: (date) => print(date),
        leftMargin: 20,
        monthColor: Colors.blueGrey,
        dayColor: Colors.teal[200],
        activeDayColor: Colors.white,
        activeBackgroundDayColor: Colors.redAccent[100],
        selectableDayPredicate: (date) => date.day >= DateTime.now().day,
        locale: 'en_ISO',
        height: MediaQuery.of(context).size.height * 0.3,
      ),
    );
  }
}
