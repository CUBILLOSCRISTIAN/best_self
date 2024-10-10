import 'package:flutter/material.dart';

import '../domain/entities/habit.dart';

List<HabitEntity> habitDatabase = [
  const HabitEntity(
    icon: Icons.fitness_center,
    id: '1',
    title: 'Exercise',
    numeroDeVeces: 3,
  ),
];

List<HabitEntity> predefinedHabits = [
  const HabitEntity(
    icon: Icons.fitness_center,
    id: '1',
    title: 'Exercise',
    numeroDeVeces: 0,
  ),
  const HabitEntity(
    icon: Icons.book,
    id: '2',
    title: 'Read',
    numeroDeVeces: 0,
  ),
  const HabitEntity(
    icon: Icons.brush,
    id: '3',
    title: 'Paint',
    numeroDeVeces: 0,
  ),
  const HabitEntity(
    icon: Icons.music_note,
    id: '4',
    title: 'Practice Music',
    numeroDeVeces: 0,
  ),
  const HabitEntity(
    icon: Icons.code,
    id: '5',
    title: 'Code',
    numeroDeVeces: 0,
  ),
];
