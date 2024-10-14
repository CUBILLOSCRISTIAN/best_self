import 'package:flutter/material.dart';

import '../../domain/entities/habit.dart';

Map<String, List<HabitEntity>> habitDatabase = {
  '0': [],
  '1': [],
  '2': [],
  '3': [],
  '4': [],
  '5': [],
  '6': []
};

List<HabitEntity> predefinedHabits = [
  HabitEntity(
    icon: Icons.fitness_center,
    id: '1',
    title: 'Exercise',
    numeroDeVeces: 0,
  ),
  HabitEntity(
    icon: Icons.book,
    id: '2',
    title: 'Read',
    numeroDeVeces: 0,
  ),
  HabitEntity(
    icon: Icons.brush,
    id: '3',
    title: 'Paint',
    numeroDeVeces: 0,
  ),
  HabitEntity(
    icon: Icons.music_note,
    id: '4',
    title: 'Practice Music',
    numeroDeVeces: 0,
  ),
  HabitEntity(
    icon: Icons.code,
    id: '5',
    title: 'Code',
    numeroDeVeces: 0,
  ),
];
