import 'package:best_self/app/domain/entities/habit.dart';
import 'package:get/get.dart';

import '../../domain/uses_cases/habit_use_cases.dart';

class HabitController extends GetxController {
  final HabitUseCases habitUseCase;
  final _habits = <HabitEntity>[].obs;
  List<HabitEntity> get habits => _habits;

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

  void getHabits() =>
      habitUseCase.getHabits().then((value) => _habits.assignAll(value));
}
