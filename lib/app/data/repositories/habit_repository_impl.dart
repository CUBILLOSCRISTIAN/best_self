import 'package:best_self/app/data/remote/i_remote_habit_source.dart';
import 'package:best_self/app/domain/entities/habit.dart';
import 'package:best_self/app/domain/repositories/i_habit_repository.dart';

class HabitRepositoryImpl implements IHabitRepository {
  final IRemoteHabitSource remoteHabitSource;

  HabitRepositoryImpl(this.remoteHabitSource);

  @override
  Future<void> addHabit(HabitEntity habit) {
    // TODO: implement addHabit
    throw UnimplementedError();
  }

  @override
  Future<void> deleteHabit(HabitEntity habit) {
    // TODO: implement deleteHabit
    throw UnimplementedError();
  }

  @override
  Future<List<HabitEntity>> getHabits() {
    return remoteHabitSource.getHabits();
  }

  @override
  Future<void> updateHabit(HabitEntity habit) {
    // TODO: implement updateHabit
    throw UnimplementedError();
  }
}
