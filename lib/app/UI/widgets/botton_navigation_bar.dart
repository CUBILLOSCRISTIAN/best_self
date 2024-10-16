import 'package:best_self/app/UI/pages/create_habit/create_habit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';

class BottonNavigationBarCustomer extends StatefulWidget {
  const BottonNavigationBarCustomer({super.key});

  @override
  _BottonNavigationBarCustomerState createState() =>
      _BottonNavigationBarCustomerState();
}

class _BottonNavigationBarCustomerState
    extends State<BottonNavigationBarCustomer> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      width: size.width,
      height: size.height * 0.1,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, size.height * 0.1),
            painter: _CustomPainter(color: theme.primaryColor),
          ),
          Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                shape: CircleBorder(
                  side: BorderSide(color: theme.primaryColor, width: 1.0),
                ),
                onPressed: () {
                  openHabitForm(context, size);
                },
                backgroundColor: theme.indicatorColor,
                child: Icon(
                  Icons.add,
                  color: theme.primaryColor,
                ),
              )),
          SizedBox(
            width: size.width,
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {},
                  color: theme.unselectedWidgetColor,
                ),
                Container(
                  width: size.width * 0.20,
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    Get.toNamed('/user-config');
                  },
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomPainter extends CustomPainter {
  final Color color;

  _CustomPainter({super.repaint, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();

    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
