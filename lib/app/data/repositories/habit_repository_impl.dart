import 'package:best_self/app/data/local/i_local_habit_source.dart';
import 'package:best_self/app/data/local/local_habit_database_source.dart';
import 'package:best_self/app/data/remote/i_remote_habit_source.dart';
import 'package:best_self/app/domain/entities/habit.dart';
import 'package:best_self/app/domain/repositories/i_habit_repository.dart';

class HabitRepositoryImpl implements IHabitRepository {
  final IRemoteHabitSource remoteHabitSource;
  final ILocalHabitSource localHabitSource;
  final LocalHabitDataBaseSource localHabitDataBaseSource;

  HabitRepositoryImpl(
    this.remoteHabitSource,
    this.localHabitSource,
    this.localHabitDataBaseSource,
  );

  @override
  Future<void> addHabit(HabitEntity habit) async {
    localHabitDataBaseSource.createHabit(habit);
  }

  @override
  Future<void> deleteHabit(HabitEntity habit) {
    // TODO: implement deleteHabit
    throw UnimplementedError();
  }

  @override
  Future<Map<String, List<HabitEntity>>> getHabits(String day) {
    return localHabitDataBaseSource.getHabits(day);
  }

  @override
  Future<void> updateHabit(String day, HabitEntity habit) {
    localHabitDataBaseSource.updateHabit(day, habit);
    if (habit.numeroDeVecesCompletadas == habit.numeroDeVeces) {}
    return Future.value();
  }

  @override
  Future<List<HabitEntity>> getPredefinedHabits() {
    return localHabitSource.getPredefinedHabits();
  }
}
