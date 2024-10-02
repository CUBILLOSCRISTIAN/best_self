import 'package:flutter/material.dart';

class HabitWidget extends StatelessWidget {
  final String habitName;
  final IconData habitIcon;
  final double progress;

  HabitWidget({super.key, 
    required this.habitName,
    required this.habitIcon,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: progress,
              strokeWidth: 6.0,
            ),
            Icon(
              habitIcon,
              size: 40.0,
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Text(
          habitName,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}