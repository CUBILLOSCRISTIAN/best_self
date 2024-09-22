class Habit {
  final String id;
  final String title;
  final DateTime time;
  final bool isCompleted;

  Habit({
    required this.id,
    required this.title,
    required this.time,
    required this.isCompleted,
  });

  factory Habit.fromJson(Map<String, dynamic> json) => Habit(
        id: json["id"],
        title: json["title"],
        time: DateTime.parse(json["time"]),
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "time": time.toIso8601String(),
        "isCompleted": isCompleted,
      };
}
