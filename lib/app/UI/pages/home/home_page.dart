import 'package:best_self/app/UI/pages/home/widgets/mascota_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/habit_controller.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/botton_navigation_bar.dart';
import '../../widgets/habit_card.dart';
import 'widgets/daily_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBarHome(Theme.of(context).primaryColor),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const ClampingScrollPhysics(), // Added this line
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DailyPage(),
                    _CustomBackground(size: size),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const PrimaryTitle(),
                          HabitList(),
                          SizedBox(
                            height: size.height * 0.06,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 0, left: 0, child: BottonNavigationBarCustomer())
            ],
          ),
        ),
      ),
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

    final path = Path()
      ..lineTo(0, initialPointY)
      ..cubicTo(
        0,
        size.height / 2,
        size.width,
        size.height,
        size.width,
        size.height / 2,
      )
      ..lineTo(
        size.width,
        0,
      )
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
  final HabitController _habitController = Get.find();

  HabitList({super.key});

  @override
  Widget build(BuildContext context) {
    final habits = _habitController.habits;
    print(_habitController.habits);

    if (habits.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 160.0),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
            'Crea tu primer hábito',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Icon(
            Icons.arrow_downward,
            color: Colors.grey,
            size: 24,
          ),
          ],
        ),
        ),
      );
    } else {
      return Obx(
        () => ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: habits.length,
          itemBuilder: (context, index) {
            return HabitCard(
              title: habits[index].title,
              subtitle: "Esto es una prueba",
              isCompleted: habits[index].isCompleted,
              icon: habits[index].icon,
              numeroDeVeces: habits[index].numeroDeVeces,
            );
          },
        ),
      );
    }
  }
}
