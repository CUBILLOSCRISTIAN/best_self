import 'package:best_self/app/domain/entities/habit.dart';

abstract class ILocalHabitSource {
  Future<Map<String, List<HabitEntity>>> getHabits(String day);
  Future<void> createHabit(HabitEntity habit);
  Future<void> updateHabit(String day,HabitEntity habit);
  Future<void> deleteHabit(String id);
  Future<List<HabitEntity>> getPredefinedHabits();
}
