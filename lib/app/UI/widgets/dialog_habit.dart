import 'package:best_self/app/UI/controllers/habit_controller.dart';
import 'package:best_self/app/data/models/API/habit.dart';
import 'package:best_self/app/domain/entities/habit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHabit extends StatefulWidget {
  final HabitEntity habit;
  const DialogHabit({super.key, required this.habit});

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
            Get.back();
          },
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            // Aquí puedes manejar la lógica para guardar el hábito con la cantidad de veces al día usando el controlador
            final habitController = Get.find<HabitController>();
            habitController.createHabit(HabitEntity(
              icon: widget.habit.icon,
              id: widget.habit.id,
              title: widget.habit.title,
              numeroDeVeces: timesPerDay,
            ));
            Get.offAllNamed('/home');
            print('Hábito seleccionado, veces al día: $timesPerDay');
          },
          child: const Text('Crear'),
        ),
      ],
    );
  }
}
