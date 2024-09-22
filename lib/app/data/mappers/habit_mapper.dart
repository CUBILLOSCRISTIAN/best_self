import '../../domain/entities/habit.dart';
import '../models/API/habit.dart';

extension HabitMapper on Habit {
  HabitEntity toEntity() {
    return HabitEntity(
      id: id,
      title: title,
      time: time,
      isCompleted: isCompleted,
    );
  }
}
