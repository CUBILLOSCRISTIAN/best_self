import 'package:flutter/material.dart';

class HabitEntity {
  final IconData icon;
  final String title;
  final int numeroDeVeces;
  String id;
  bool isCompleted;
  int numeroDeVecesCompletadas = 0;

  HabitEntity({
    required this.icon,
    required this.id,
    required this.title,
    required this.numeroDeVeces,
    this.isCompleted = false,
  });

  // List<Object> get props => [title, time, isCompleted];
}
