import 'package:best_self/UI/pages/home/widgets/date_wigget.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hey, CRISTIAN!'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DateWigget(mounth: 'JAN', day: '01'),
                DateWigget(mounth: 'JAN', day: '02'),
                DateWigget(mounth: 'JAN', day: '03', isSelected: true),
                DateWigget(mounth: 'JAN', day: '04'),
                DateWigget(mounth: 'JAN', day: '05'),
                DateWigget(mounth: 'JAN', day: '06'),
                DateWigget(mounth: 'JAN', day: '07'),
              ],
            ),
            Container(
              height: size.height * 0.3,
              color: Colors.red,
            ),
            Container(
              height: size.height * 0.6,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
