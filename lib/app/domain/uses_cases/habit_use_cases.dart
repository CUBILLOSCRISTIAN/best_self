import 'package:best_self/app/domain/repositories/i_habit_repository.dart';

import '../entities/habit.dart';

class HabitUseCases {
  final IHabitRepository _habitRepository;

  HabitUseCases(this._habitRepository);

  Future<void> addHabit(HabitEntity habit) async {
    await _habitRepository.addHabit(habit);
  }

  Future<void> deleteHabit(HabitEntity habit) async {
    await _habitRepository.deleteHabit(habit);
  }

  Future<Map<String, List<HabitEntity>>> getHabits(String day) async {
    return await _habitRepository.getHabits(day);
  }

  Future<void> updateHabit(String day, HabitEntity habit) async {
    await _habitRepository.updateHabit(day, habit);
  }

  Future<List<HabitEntity>> getPredefinedHabits() async {
    return await _habitRepository.getPredefinedHabits();
  }
}
