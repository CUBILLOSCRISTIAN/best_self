import 'package:best_self/app/UI/config/routes.dart';
import 'package:best_self/app/UI/controllers/user_controller.dart';
import 'package:best_self/app/data/remote/i_remote_habit_source.dart';
import 'package:best_self/app/data/remote/remote_habit_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/UI/controllers/habit_controller.dart';
import 'app/data/local/i_local_habit_source.dart';
import 'app/data/local/loca_habit_source.dart';
import 'app/data/repositories/habit_repository_impl.dart';
import 'app/domain/repositories/i_habit_repository.dart';
import 'app/domain/uses_cases/habit_use_cases.dart';

void main() {
  Get.put(UserController());

  Get.put<IRemoteHabitSource>(RemoteHabitSource());
  Get.put<ILocalHabitSource>(LocalHabitSource());
  Get.put<IHabitRepository>(HabitRepositoryImpl(Get.find(), Get.find()));
  Get.put(HabitUseCases(Get.find()));
  Get.put(HabitController(Get.find()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      getPages: AppRoutes.routes,
    );
  }
}
