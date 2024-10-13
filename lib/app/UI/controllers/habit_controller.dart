import 'package:best_self/app/domain/entities/habit.dart';
import 'package:get/get.dart';

import '../../domain/uses_cases/habit_use_cases.dart';

class HabitController extends GetxController {
  final HabitUseCases habitUseCase;
  final _habits = <HabitEntity>[].obs;
  final _predefinedHabits = <HabitEntity>[].obs;
  List<HabitEntity> get habits => _habits;
  List<HabitEntity> get predefinedHabits => _predefinedHabits;

  var completionPercentage = 1.0.obs;

  HabitController(this.habitUseCase);

  @override
  void onInit() {
    super.onInit();
    getHabits();
  }

  void updateCompletion(double value) {
    completionPercentage.value = value;
  }

  void getHabits() {
    habitUseCase.getHabits().then((value) => _habits.assignAll(value));
    habitUseCase.getPredefinedHabits().then((value) => _predefinedHabits.assignAll(value));
  }

  void createHabit(HabitEntity habit) {
    habitUseCase.addHabit(habit).then((_) => getHabits());
  }

  void incrementarVecesCompletadas(HabitEntity habit) {
    habit.numeroDeVecesCompletadas++;
    if( habit.numeroDeVecesCompletadas == habit.numeroDeVeces){
      habit.isCompleted = true;
    }
    habitUseCase.updateHabit(habit).then((_) => getHabits());
  }
}
