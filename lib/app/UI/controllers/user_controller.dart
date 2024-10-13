import 'package:get/get.dart';

class UserController extends GetxController {
  // Observable variables
  var completedHabits = 0.obs;
  var coinsEarned = 0.obs;

  // Method to increment completed habits
  void incrementHabits() {
    completedHabits.value++;
  }

  // Method to add coins
  void addCoins(int coins) {
    coinsEarned.value += coins;
  }

  // Method to reset user data
  void resetUserData() {
    completedHabits.value = 0;
    coinsEarned.value = 0;
  }
}