import 'dart:convert';

import 'package:best_self/app/data/mappers/habit_mapper.dart';
import 'package:best_self/app/data/models/API/habit.dart';
import 'package:best_self/app/data/remote/i_remote_habit_source.dart';
import 'package:best_self/app/domain/entities/habit.dart';
import 'package:http/http.dart' as http;

class RemoteHabitSource implements IRemoteHabitSource {
  var baseURL =
      'https://my-json-server.typicode.com/CUBILLOSCRISTIAN/API_habit';

  @override
  Future<HabitEntity> createHabit(HabitEntity habit) {
    // TODO: implement createHabit
    throw UnimplementedError();
  }

  @override
  Future<void> deleteHabit(String id) {
    // TODO: implement deleteHabit
    throw UnimplementedError();
  }

  @override
  Future<List<HabitEntity>> getHabits() async {
    try {
      final response = await http.get(Uri.parse('$baseURL/habits'));
      if (response.statusCode == 200) {
        dynamic jsonDecode = json.decode(response.body);
        List<Habit> habitsList =
            (jsonDecode as List).map((habit) => Habit.fromJson(habit)).toList();
        return habitsList.map((habit) => habit.toEntity()).toList();
      } else {
        throw Exception('Failed to load habits');
      }
    } catch (e) {
      throw Exception('Failed to load habits: $e');
    }
  }

  @override
  Future<HabitEntity> updateHabit(HabitEntity habit) {
    // TODO: implement updateHabit
    throw UnimplementedError();
  }
}
