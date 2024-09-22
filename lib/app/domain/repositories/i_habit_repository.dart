import 'package:best_self/app/domain/entities/habit.dart';

abstract class IHabitRepository {
  Future<List<HabitEntity>> getHabits();
  Future<void> addHabit(HabitEntity habit);
  Future<void> updateHabit(HabitEntity habit);
  Future<void> deleteHabit(HabitEntity habit);
}
