import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Achivements extends StatefulWidget {
  final String tipeAchievement;
  final String imagePath;

  const Achivements({
    super.key,
    required this.tipeAchievement,
    required this.imagePath,
  });

  @override
  State<Achivements> createState() => _AchivementsState();
}

class _AchivementsState extends State<Achivements> {
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

    _confettiController.play();
    
    return Stack(
      alignment: Alignment.center,
      children: [
        AlertDialog(
          title: const Text('¡Felicitaciones!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(widget.imagePath),
              const SizedBox(height: 10),
              Text('¡Has completado una meta y obtenido tu medalla de ${widget.tipeAchievement}!'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        ),
        ConfettiWidget(
          confettiController: _confettiController,
          blastDirection: -3.14 / 2, // hacia arriba
          emissionFrequency: 0.05,
          numberOfParticles: 20,
          gravity: 0.1,
        ),
      ],
    );
    
  }

  
}
