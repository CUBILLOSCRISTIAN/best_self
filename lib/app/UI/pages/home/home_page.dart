import 'package:best_self/app/UI/pages/home/widgets/mascota_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/habit_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBarHome(Theme.of(context).primaryColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CustomBackground(size: size),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const PrimaryTitle(),
                    HabitList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  AppBar appBarHome(Color color) {
    return AppBar(
      backgroundColor: color,
      leading: const Padding(
        padding: EdgeInsets.all(5.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://avatars.githubusercontent.com/u/583231?v=4"),
        ),
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello,",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "John Doe",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        IconButton.outlined(
          onPressed: () {},
          icon: const Icon(Icons.add),
        )
      ],
    );
  }
}

class _CustomBackground extends StatelessWidget {
  const _CustomBackground({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context);

    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.28,
          width: size.width,
          child: CustomPaint(
            painter: MultiParablePainter(color.primaryColor),
          ),
        ),
        SizedBox(
          height: size.height * 0.28,
          width: size.width,
          child: Center(child: MascotaScreen()),
        ),
      ],
    );
  }
}

class MultiParablePainter extends CustomPainter {
  final Color color;

  MultiParablePainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final brush = Paint()..color = color;

    final initialPointY = size.height * 1;

    final controlPointX1 = size.width*0.5;
    final controlPointY1 = size.width*0.3;

    final path = Path()
      ..lineTo(0, initialPointY)
      ..quadraticBezierTo(
        controlPointX1,
        controlPointY1,
        size.width,
        initialPointY,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PrimaryTitle extends StatelessWidget {
  const PrimaryTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Monitorea",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        Text(
          "tus habitos",
          style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class HabitList extends StatelessWidget {
  final List<String> habits = ["Shopping", "Cycling", "Read a book"];

  final HabitController _habitController = Get.find();

  HabitList({super.key});

  @override
  Widget build(BuildContext context) {
    final habits = _habitController.habits;
    print(_habitController.habits);

    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        itemCount: habits.length,
        itemBuilder: (context, index) {
          return HabitCard(
            title: habits[index].title,
            subtitle: "Esto es una prueba",
            isCompleted: habits[index].isCompleted,
          );
        },
      ),
    );
  }
}

class HabitCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isCompleted;

  const HabitCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context);
    return Card(
      color: color.hoverColor,
      elevation: 0,
      child: ListTile(
        leading: const Icon(Icons.air_sharp),
        title: Text(title),
        subtitle: Text(subtitle ?? ""),
        trailing: isCompleted
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.circle_outlined),
      ),
    );
  }
}
