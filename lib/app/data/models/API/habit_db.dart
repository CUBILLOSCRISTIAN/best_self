import 'package:best_self/app/domain/entities/habit.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'habit_db.g.dart';

@HiveType(typeId: 0)
class HabitDb {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String icon;
  @HiveField(3)
  final int numeroDeVeces;
  @HiveField(4)
  final bool isCompleted;

  HabitDb({
    required this.id,
    required this.title,
    required this.icon,
    required this.numeroDeVeces,
    required this.isCompleted,
  });

  HabitEntity toEntity() {
    return HabitEntity(
      id: id,
      title: title,
      icon: IconData(int.parse(icon), fontFamily: 'MaterialIcons'),
      numeroDeVeces: numeroDeVeces,
      isCompleted: isCompleted,
    );
  }

  factory HabitDb.fromEntity(HabitEntity habit) {
    return HabitDb(
      id: habit.id,
      title: habit.title,
      icon: habit.icon.codePoint.toString(),
      numeroDeVeces: habit.numeroDeVeces,
      isCompleted: habit.isCompleted,
    );
  }
}
