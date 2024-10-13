import 'package:best_self/app/UI/controllers/habit_controller.dart';
import 'package:best_self/app/domain/entities/habit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/Models/configuration.dart';
import 'package:flutter_iconpicker/Models/icon_pack.dart';
import 'package:flutter_iconpicker/Models/icon_picker_icon.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart'
    as FlutterIconPicker;
import 'package:get/get.dart';

class CustomHabit extends StatefulWidget {
  @override
  _CustomHabitState createState() => _CustomHabitState();
}

class _CustomHabitState extends State<CustomHabit> {
  final TextEditingController textHabitController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int timesPerDay = 1;
  IconData selectedIcon = Icons.star;

  void selectIcon() async {
    final IconPickerIcon? icon = await FlutterIconPicker.showIconPicker(
      context,
      configuration: const SinglePickerConfiguration(
        iconPackModes: [IconPack.material,IconPack.cupertino],

        title: Text('Seleccione un ícono'),

      ),
    );

    if (icon != null) {
      setState(() {
        selectedIcon = icon as IconData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      title: const Text('Crea tu nuevo hábito'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: textHabitController,
                decoration: const InputDecoration(
                  labelText: '¿Como se llama tu hábito?',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un nombre!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('¿Cuántas veces al día?'),
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
              const SizedBox(height: 16),
              const Text(
                'Seleccione un ícono:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              IconButton(
                icon: Icon(selectedIcon),
                onPressed: selectIcon,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('Guardar Hábito'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final String habitName = textHabitController.text;

              final HabitEntity newHabit = HabitEntity(
                id: DateTime.now().toString(),
                title: habitName,
                numeroDeVeces: timesPerDay,
                icon: selectedIcon,
                isCompleted: false,
              );

              final habitController = Get.find<HabitController>();
              habitController.createHabit(newHabit);
              Get.offAllNamed('/home');
            }
          },
        ),
      ],
    );
  }
}
