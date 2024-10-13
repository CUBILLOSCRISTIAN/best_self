import 'package:best_self/app/domain/entities/habit.dart';

abstract class ILocalHabitSource {
  Future<List<HabitEntity>> getHabits();
  Future<HabitEntity> createHabit(HabitEntity habit);
  Future<HabitEntity> updateHabit(HabitEntity habit);
  Future<void> deleteHabit(String id);
  Future<List<HabitEntity>> getPredefinedHabits();
}
