import 'dart:math';

import 'package:best_self/app/data/local/i_local_habit_source.dart';
import 'package:best_self/app/data/models/API/habit_db.dart';
import 'package:best_self/app/domain/entities/habit.dart';
import 'package:hive/hive.dart';

class LocalHabitDataBaseSource implements ILocalHabitSource {
  @override
  Future<void> createHabit(HabitEntity habit) async {
    habit.id = generateRandomId();
    final habitDb = HabitDb.fromEntity(habit);

    var box = Hive.box<Map<String, List<HabitDb>>>('habithive');

    Map<String, List<HabitDb>> habitDatabase = box.get('habithive') ??
        {
          '0': [],
          '1': [],
          '2': [],
          '3': [],
          '4': [],
          '5': [],
          '6': [],
        };

    for (var day in habitDatabase.keys) {
      habitDatabase[day]?.add(habitDb);
    }

    await box.put('habithive', habitDatabase);
  }

  @override
  Future<void> deleteHabit(String id) async {
    var box = Hive.box<Map<String, List<HabitDb>>>('habithive');
    await box.delete(id);
  }

  @override
  Future<Map<String, List<HabitEntity>>> getHabits(String day) async {
    var box = Hive.box<Map<String, List<HabitDb>>>('habithive');

    Map<String, List<HabitDb>>? habitsMap = box.get('habithive');

    List<HabitDb> habits = habitsMap?[day] ?? [];

    return {
      day: habits.map((habit) => habit.toEntity()).toList(),
    };
  }

  @override
  Future<List<HabitEntity>> getPredefinedHabits() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateHabit(String day, HabitEntity habit) async {
    var box = Hive.box<Map<String, List<HabitDb>>>('habithive');

    Map<String, List<HabitDb>>? habitsMap = box.get('habithive');

    List<HabitDb> habits = habitsMap?[day] ?? [];

    habits = habits.map((h) {
      if (h.id == habit.id) {
        return HabitDb.fromEntity(habit);
      }
      return h;
    }).toList();

    habitsMap?[day] = habits;

    await box.put('habithive', habitsMap!);

    // await box.put(habit.id, HabitDb.fromEntity(habit));
  }

  String generateRandomId() {
    final random = Random();
    final id = List<int>.generate(10, (_) => random.nextInt(10));
    return id.join();
  }
}
