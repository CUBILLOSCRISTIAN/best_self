import 'package:flutter/material.dart';

class DialogHabit extends StatefulWidget {
  const DialogHabit({super.key});

  @override
  State<DialogHabit> createState() => _DialogHabitState();
}

class _DialogHabitState extends State<DialogHabit> {
  var timesPerDay = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('¿Cuántas veces al día?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
              'Selecciona cuántas veces al día quieres realizar este hábito:'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  if (timesPerDay > 1) {
                    setState(() {
                      timesPerDay--;
                    });
                  }
                },
              ),
              Text(
                '$timesPerDay',
                style: const TextStyle(fontSize: 20),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    timesPerDay++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            // Aquí puedes manejar la lógica para guardar el hábito con la cantidad de veces al día
            Navigator.of(context).pop();
            print('Hábito seleccionado, veces al día: $timesPerDay');
          },
          child: const Text('Crear'),
        ),
      ],
    );
  }
}
