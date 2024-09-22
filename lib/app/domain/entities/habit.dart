class HabitEntity {
  final String title;
  final DateTime time;
  final bool isCompleted;
  final String id;

  const HabitEntity({
    required this.id,
    required this.title,
    required this.time,
    this.isCompleted = false,
  });

  // List<Object> get props => [title, time, isCompleted];
}
