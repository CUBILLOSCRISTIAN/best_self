import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class MascotaScreen extends StatefulWidget {
  @override
  _MascotaScreenState createState() => _MascotaScreenState();
}

class _MascotaScreenState extends State<MascotaScreen> {
  // Lista de mensajes que queremos mostrar
  final List<String> _messages = [
    '¡Sigue adelante, lo estás haciendo genial!',
    'Recuerda que cada paso cuenta.',
    '¡Estás muy cerca de alcanzar tu meta!',
  ];

  // Controlador del texto actual para el efecto de máquina de escribir
  String _currentText = '';
  int _messageIndex = 0;
  int _charIndex = 0;
  Timer? _typingTimer;

  @override
  void initState() {
    super.initState();
    _startMessageStream();
  }

  @override
  void dispose() {
    _typingTimer
        ?.cancel(); // Cancela el temporizador cuando el widget se destruye
    super.dispose();
  }

  // Función para iniciar el stream de mensajes
  void _startMessageStream() {
    // Cambia el mensaje cada 5 segundos
    Stream.periodic(Duration(seconds: 10)).listen((_) {
      _changeMessage();
    });
    _changeMessage(); // Inicializa con el primer mensaje
  }

  // Cambiar al siguiente mensaje
  void _changeMessage() {
    if (_messageIndex >= _messages.length) {
      _messageIndex = 0; // Reinicia si se pasa del último mensaje
    }
    _charIndex = 0; // Reinicia el índice del carácter
    _currentText = ''; // Vacía el texto actual
    _startTypingEffect(_messages[_messageIndex]);
    _messageIndex++;
  }

  // Efecto de máquina de escribir
  void _startTypingEffect(String message) {
    _typingTimer?.cancel(); // Cancela el temporizador anterior si existe

    _typingTimer = Timer.periodic(Duration(milliseconds: 100), (Timer timer) {
      if (_charIndex < message.length) {
        setState(() {
          _currentText += message[_charIndex]; // Agrega un carácter
          _charIndex++;
        });
      } else {
        timer
            .cancel(); // Termina el efecto de escribir cuando completa el mensaje
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Globo de diálogo
        Positioned(
          top: screenHeight * 0.02,
          right: screenWidth * 0.01,
          child: Container(
            padding: EdgeInsets.all(screenWidth * 0.04),
            width: screenWidth * 0.6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Text(
              _currentText,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        // Mascota
        Positioned(
          bottom: 0,
          left: 0,
          child: FadeInLeft(
            duration: const Duration(seconds: 1),
            child: Image.asset(
              'assets/pet/panda_home.png',
              width: screenWidth * 0.55,
            ),
          ),
        ),
      ],
    );
  }
}
