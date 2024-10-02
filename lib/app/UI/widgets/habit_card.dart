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
        title: Text(title),
        subtitle: Text(subtitle ?? ""),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                // Aquí puedes agregar la lógica para restar
              },
            ),
            Text(
              '$numeroDeVeces', // Aquí puedes mostrar el valor de la variable
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}