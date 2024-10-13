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

  Future<List<HabitEntity>> getHabits() async {
    return await _habitRepository.getHabits();
  }

  Future<void> updateHabit(HabitEntity habit) async {
    await _habitRepository.updateHabit(habit);
  }

  Future<List<HabitEntity>> getPredefinedHabits() async {
    return await _habitRepository.getPredefinedHabits();
  }
  
}