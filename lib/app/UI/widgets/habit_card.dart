import 'package:best_self/app/UI/controllers/habit_controller.dart';
import 'package:best_self/app/UI/controllers/user_controller.dart';
import 'package:best_self/app/UI/widgets/achivements.dart';
import 'package:best_self/app/domain/entities/habit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HabitCard extends StatelessWidget {
  final HabitEntity habit;

  const HabitCard({
    super.key,
    required this.habit,
  });

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
    final color = Theme.of(context);
    var progress = habit.numeroDeVecesCompletadas / habit.numeroDeVeces;

    return Card(
      color: color.hoverColor,
      elevation: 0,
      child: ListTile(
        leading: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            ),
            Icon(habit.icon),
          ],
        ),
        title: Text(habit.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: habit.isCompleted
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
                  Text(
                      '${habit.numeroDeVecesCompletadas} de ${habit.numeroDeVeces} completados'),
                ],
              ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  Get.find<HabitController>()
                      .incrementarVecesCompletadas(habit);
                  if (habit.numeroDeVecesCompletadas == habit.numeroDeVeces) {
                    Get.defaultDialog(
                      title: '¡Habito completado!',
                      middleText:
                          '¡Has completado el habito de ${habit.title}!',
                        textConfirm: 'Cerrar',
                        confirmTextColor: Colors.white,
                        onConfirm: () {
                        Get.back();
                        },
                    );

                    switch (userController.completedHabits.value) {
                      case 10:
                        showDialog(
                            context: context,
                            builder: (_) => const Achivements(
                                tipeAchievement: 'Bronce',
                                imagePath: 'assets/achievements/bronce.png'));
                        break;

                      case 20:
                        showDialog(
                            context: context,
                            builder: (_) => const Achivements(
                                tipeAchievement: 'Plata',
                                imagePath: 'assets/achievements/plata.png'));
                        break;

                      case 30:
                        showDialog(
                            context: context,
                            builder: (_) => const Achivements(
                                tipeAchievement: 'Oro',
                                imagePath: 'assets/achievements/oro.png'));
                        break;
                    }
                  }
                },
                icon: Icon(
                  Icons.add_circle_outline_outlined,
                  color: color.primaryColor,
                )),
          ],
        ),
      ),
    );
  }
}
