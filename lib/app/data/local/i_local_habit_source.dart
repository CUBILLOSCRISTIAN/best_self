import 'package:best_self/app/domain/entities/habit.dart';

abstract class ILocalHabitSource {
  Future<Map<String, List<HabitEntity>>> getHabits(String day);
  Future<HabitEntity> createHabit(HabitEntity habit);
  Future<HabitEntity> updateHabit(String day,HabitEntity habit);
  Future<void> deleteHabit(String id);
  Future<List<HabitEntity>> getPredefinedHabits();
}
