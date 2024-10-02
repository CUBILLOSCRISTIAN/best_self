import 'package:flutter/material.dart';

class Habit {
  final String id;
  final String title;
  final IconData icon;
  final int numeroDeVeces;
  final bool isCompleted;

  Habit({
    required this.id,
    required this.title,
    required this.icon,
    required this.numeroDeVeces,
    required this.isCompleted,
  });

  factory Habit.fromJson(Map<String, dynamic> json) => Habit(
        id: json["id"],
        title: json["title"],
        icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
        numeroDeVeces: json["numeroDeVeces"],
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
        "numeroDeVeces": numeroDeVeces,
        "isCompleted": isCompleted,
      };
}
