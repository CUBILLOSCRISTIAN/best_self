import 'package:flutter/material.dart';

class DateWigget extends StatelessWidget {
  DateWigget({
    super.key,
    this.mounth,
    this.day,
    this.isSelected = false,
  });

  final mounth;

  final day;

  bool? isSelected;

  final isSelectedStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  final unSelectedStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );

  final isSelectedStyleDecoration = BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(50),
  );

  final unSelectedStyleDecoration = BoxDecoration(
    color: Colors.black87,
    borderRadius: BorderRadius.circular(50),
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      decoration:
          isSelected! ? isSelectedStyleDecoration : unSelectedStyleDecoration,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$mounth',
              style: isSelected! ? isSelectedStyle : unSelectedStyle,
            ),
            Text('$day ',
                style: isSelected! ? isSelectedStyle : unSelectedStyle),
          ],
        ),
      ),
    );
  }
}
