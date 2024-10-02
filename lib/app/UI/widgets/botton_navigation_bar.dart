import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/custom-habits/custom_habits.dart';

class BottonNavigationBarCustomer extends StatelessWidget {
  BottonNavigationBarCustomer({super.key});

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
                  showHabitForm(context, size);
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
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Get.toNamed('/shop');
                  },
                  color: Colors.white,
                ),
                Container(
                  width: size.width * 0.20,
                ),
                IconButton(
                  icon: const Icon(Icons.stars),
                  onPressed: () {},
                  color: Colors.white,
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {},
                  color: Colors.white,
                ),
              ],
            ),
          )
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
