import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/habit_controller.dart';
import '../../widgets/dialog_habit.dart';
import '../custom-habits/custom_habits.dart';

class HabitOption {
  final IconData icon;
  final String name;

  HabitOption({required this.icon, required this.name});
}

class HabitSelectionWidget extends StatefulWidget {
  final List<HabitOption> habitOptions;
  final ValueChanged<int?> onSelectionChanged;

  const HabitSelectionWidget({
    super.key,
    required this.habitOptions,
    required this.onSelectionChanged,
  });

  @override
  _HabitSelectionWidgetState createState() => _HabitSelectionWidgetState();
}

class _HabitSelectionWidgetState extends State<HabitSelectionWidget> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: widget.habitOptions.asMap().entries.map((entry) {
        int idx = entry.key;
        HabitOption option = entry.value;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = idx;
              widget.onSelectionChanged(selectedIndex);
            });
          },
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: selectedIndex == idx
                ? theme.colorScheme.primary
                : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    option.icon,
                    color: selectedIndex == idx
                        ? Colors.white
                        : theme.iconTheme.color,
                    size: 30,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    option.name,
                    style: TextStyle(
                      color: selectedIndex == idx
                          ? Colors.white
                          : theme.iconTheme.color,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

void openHabitForm(BuildContext context, Size size) {
  final HabitController habitController = Get.find();
  int? selectedHabitIndex;

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
            child: Container(
              height: size.height * 0.8,
              color: Colors.white,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 80,
                          height: 5,
                          margin: const EdgeInsets.only(bottom: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Crearemos un nuevo habito',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey[300],
                          thickness: 1,
                        ),
                        const SizedBox(height: 16),
                        const Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Empecemos por seleccionar uno de los hábitos predefinidos',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Flexible(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                HabitSelectionWidget(
                                  habitOptions: [
                                    ...habitController.predefinedHabits.map((habit) => HabitOption(
                                      icon: habit.icon,
                                      name: habit.title,
                                    )),
                                    HabitOption(icon: Icons.add, name: 'Personalizado'),
                                  ],
                                  onSelectionChanged: (index) {
                                    setState(() {
                                      selectedHabitIndex = index;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: selectedHabitIndex == null ? null : () {
                            if (selectedHabitIndex == habitController.predefinedHabits.length) {
                              // Acción para "Personalizado"
                              showHabitForm(context, size);
                              print('Personalizado seleccionado');
                            } else {
                              // Acción para otros hábitos
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  final selectedHabit = habitController.predefinedHabits[selectedHabitIndex!];
                                  return DialogHabit(habit: selectedHabit);
                                });
                                
                              
                              print('Hábito predefinido seleccionado');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: Theme.of(context).colorScheme.onPrimary,
                            iconColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Siguiente',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
