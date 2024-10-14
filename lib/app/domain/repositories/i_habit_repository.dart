import 'package:best_self/app/domain/entities/habit.dart';

abstract class IHabitRepository {
  Future<Map<String, List<HabitEntity>>> getHabits(String day);
  Future<void> addHabit(HabitEntity habit);
  Future<void> updateHabit(String day, HabitEntity habit);
  Future<void> deleteHabit(HabitEntity habit);
  Future<List<HabitEntity>> getPredefinedHabits();
}
