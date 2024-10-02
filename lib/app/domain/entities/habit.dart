import 'package:flutter/material.dart';

class HabitEntity {
  final IconData icon;
  final String title;
  final int numeroDeVeces;
  final bool isCompleted;
  final String id;

  const HabitEntity({
    required this.icon,
    required this.id,
    required this.title,
    required this.numeroDeVeces,
    this.isCompleted = false,
  });

  // List<Object> get props => [title, time, isCompleted];
}
