import 'package:best_self/app/data/local/i_local_habit_source.dart';
import 'package:best_self/app/data/remote/i_remote_habit_source.dart';
import 'package:best_self/app/domain/entities/habit.dart';
import 'package:best_self/app/domain/repositories/i_habit_repository.dart';

class HabitRepositoryImpl implements IHabitRepository {
  final IRemoteHabitSource remoteHabitSource;
  final ILocalHabitSource localHabitSource; 

  HabitRepositoryImpl(this.remoteHabitSource, this.localHabitSource);

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
    return localHabitSource.getHabits();
  }

  @override
  Future<void> updateHabit(HabitEntity habit) {
    // TODO: implement updateHabit
    throw UnimplementedError();
  }

  Future<List<HabitEntity>> getPredefinedHabits() {
    return localHabitSource.getPredefinedHabits();
  }
}
