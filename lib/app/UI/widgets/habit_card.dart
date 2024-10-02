import 'package:flutter/material.dart';

class HabitCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isCompleted;
  final IconData icon;
  final int numeroDeVeces;

  const HabitCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.isCompleted,
    required this.icon,
    required this.numeroDeVeces,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context);
    return Card(
      color: color.hoverColor,
      elevation: 0,
      child: ListTile(
        leading: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: isCompleted ? 0.6 : 0.0,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(
                  isCompleted ? Colors.green : Colors.red),
            ),
            Icon(icon),
          ],
        ),
        title: Text(title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: isCompleted
            ? Row(
                children: [
                  Icon(Icons.check_circle, color: color.primaryColor),
                  const SizedBox(width: 5),
                  const Text('Completado'),
                ],
              )
            : Row(
                children: [
                  Icon(Icons.info_outline_rounded, color: color.primaryColor),
                  const SizedBox(width: 5),
                  Text('1 de $numeroDeVeces completados'),
                ],
              ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_circle_outline_outlined,
                    color: color.primaryColor)),
          ],
        ),
      ),
    );
  }
}
