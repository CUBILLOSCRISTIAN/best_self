import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/habit_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Organize your life with Habito",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 20),
              HabitProgressCard(),
              HabitList(),
            ],
          ),
        ),
      ),
    );
  }
}

class HabitProgressCard extends StatelessWidget {
  final HabitController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Let's make a habit together",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),
            Obx(() => CircularProgressIndicator(
                  value: _controller.completionPercentage.value,
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                )),
            SizedBox(height: 10),
            Obx(() => Text(
                  "${(_controller.completionPercentage.value * 100).toStringAsFixed(0)}% completed",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}

class HabitList extends StatelessWidget {
  final List<String> habits = ["Shopping", "Cycling", "Read a book"];

  HabitController _habitController = Get.find();

  @override
  Widget build(BuildContext context) {
    final habits = _habitController.habits;
    print(_habitController.habits);

    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        itemCount: habits.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(habits[index].title),
              subtitle: Text("Completed today"),
              trailing: Icon(Icons.check_circle, color: Colors.green),
            ),
          );
        },
      ),
    );
  }
}
