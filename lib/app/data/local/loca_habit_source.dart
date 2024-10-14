import 'dart:math';

import 'package:best_self/app/domain/entities/habit.dart';

import '../database/database_habit.dart';
import 'i_local_habit_source.dart';

class LocalHabitSource implements ILocalHabitSource {
  @override
  Future<void> deleteHabit(String id) {
    // habitDatabase.removeWhere((habit) => habit.id == id);
    return Future.value();
  }

  @override
  Future<Map<String, List<HabitEntity>>> getHabits(String day) {
    final habitsForDay = habitDatabase[day] ?? [];

    habitDatabase.forEach((key, value) {
      print('Habits for day $key:');
      value.forEach((element) {
        print(element.id);
      });
    });
    return Future.value({day: habitsForDay});
  }

  @override
  Future<HabitEntity> updateHabit(String day, HabitEntity habit) {
    final habitsForDay = List<HabitEntity>.from(habitDatabase[day] ?? []);
    final index = habitsForDay.indexWhere((element) => element.id == habit.id);
    if (index != -1) {
      habitsForDay[index] = habit;
      habitDatabase[day] =
          habitsForDay; // Actualiza la base de datos con la lista modificada
    }
    return Future.value(habit);
  }

  @override
  Future<HabitEntity> createHabit(HabitEntity habit) {
    habitDatabase.forEach((key, value) {
      final newHabit = HabitEntity(
        id: generateRandomId(),
        title: habit.title, icon: habit.icon,
        numeroDeVeces: habit.numeroDeVeces,
      );
      value.add(newHabit);
    });
    return Future.value(habit);
  }

  String generateRandomId() {
    final random = Random();
    final id = List<int>.generate(10, (_) => random.nextInt(10));
    return id.join();
  }

  @override
  Future<List<HabitEntity>> getPredefinedHabits() {
    return Future.value(predefinedHabits);
  }
}
