import 'package:best_self/app/UI/controllers/user_controller.dart';
import 'package:best_self/app/domain/entities/habit.dart';
import 'package:get/get.dart';

import '../../domain/uses_cases/habit_use_cases.dart';

class HabitController extends GetxController {
  final HabitUseCases habitUseCase;
  final _habits = <HabitEntity>[].obs;
  final _predefinedHabits = <HabitEntity>[].obs;
  List<HabitEntity> get habits => _habits;
  List<HabitEntity> get predefinedHabits => _predefinedHabits;

  RxString dayController = '0'.obs;

  var completionPercentage = 1.0.obs;

  HabitController(this.habitUseCase);

  UserController userController = Get.find<UserController>();

  void updateDayController(String day) {
    dayController.value = day;
    getHabits(day);
  }

  @override
  void onInit() {
    super.onInit();
    getHabits(dayController.value);
  }

  void updateCompletion(double value) {
    completionPercentage.value = value;
  }

  void getHabits(String day) {
    // habitUseCase.getHabits(day).then((value) => _habits.assignAll(value.values.expand((element) => element).toList()));
    habitUseCase.getHabits(day).then((value) {
      _habits.assignAll(value.values.expand((element) => element).toList());
    });

    habitUseCase
        .getPredefinedHabits()
        .then((value) => _predefinedHabits.assignAll(value));
  }

  void createHabit(HabitEntity habit) {
    habitUseCase.addHabit(habit).then((_) => getHabits(dayController.value));
  }

  void incrementarVecesCompletadas(HabitEntity habit) {
    habit.numeroDeVecesCompletadas++;
    if (habit.numeroDeVecesCompletadas == habit.numeroDeVeces) {
      habit.isCompleted = true;
      userController.incrementHabits();
      userController.addCoins(5);
    }
    habitUseCase
        .updateHabit(dayController.value, habit)
        .then((_) => getHabits(dayController.value));
  }
}
