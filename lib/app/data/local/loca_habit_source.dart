import 'package:best_self/app/domain/entities/habit.dart';

import '../database/database_habit.dart';
import 'i_local_habit_source.dart';

class LocalHabitSource implements ILocalHabitSource {
  @override
  Future<void> deleteHabit(String id) {
    habitDatabase.removeWhere((habit) => habit.id == id);
    return Future.value();
  }

  @override
  Future<List<HabitEntity>> getHabits() {
    return Future.value(habitDatabase);
  }

  @override
  Future<HabitEntity> updateHabit(HabitEntity habit) {
    habitDatabase[habitDatabase.indexWhere((element) => element.id == habit.id)] = habit;
    return Future.value(habit);
  }
  
  @override
  Future<HabitEntity> createHabit(HabitEntity habit) {
    habitDatabase.add(habit);
    return Future.value(habit);
  }

  @override
  Future<List<HabitEntity>> getPredefinedHabits() {
    return Future.value(predefinedHabits);
  }
}
