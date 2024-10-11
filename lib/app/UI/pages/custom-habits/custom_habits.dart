import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/Models/icon_picker_icon.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart'
    as FlutterIconPicker;

class CustomHabit extends StatefulWidget {
  @override
  _CustomHabitState createState() => _CustomHabitState();
}

class _CustomHabitState extends State<CustomHabit> {
  final TextEditingController habitController = TextEditingController();
  int timesPerDay = 1;
  IconData selectedIcon = Icons.star;

  void selectIcon() async {
    final IconPickerIcon? icon =
        await FlutterIconPicker.showIconPicker(context);

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: habitController,
              decoration: const InputDecoration(
                labelText: 'Ingrese su hábito',
              ),
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
              onPressed: () {
                selectIcon();
              },
            ),
          ],
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
            // Aquí puedes manejar el guardado del hábito
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
