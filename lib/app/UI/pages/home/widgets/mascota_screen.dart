import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class MascotaScreen extends StatefulWidget {
  @override
  _MascotaScreenState createState() => _MascotaScreenState();
}

class _MascotaScreenState extends State<MascotaScreen> {
  final List<String> _messages = [
    '¡Sigue adelante, lo estás haciendo genial!',
    'Recuerda que cada paso cuenta.',
    '¡Estás muy cerca de alcanzar tu meta!',
  ];

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
    _typingTimer?.cancel();
    super.dispose();
  }

  void _startMessageStream() {
    Stream.periodic(Duration(seconds: 10)).listen((_) {
      if (mounted) {
        _changeMessage();
      }
    });
    _changeMessage();
  }

  void _changeMessage() {
    if (_messageIndex >= _messages.length) {
      _messageIndex = 0;
    }
    _charIndex = 0;
    _currentText = '';
    _startTypingEffect(_messages[_messageIndex]);
    _messageIndex++;
  }

  void _startTypingEffect(String message) {
    _typingTimer?.cancel();

    _typingTimer = Timer.periodic(Duration(milliseconds: 100), (Timer timer) {
      if (_charIndex < message.length) {
        if (mounted) {
          setState(() {
            _currentText += message[_charIndex];
            _charIndex++;
          });
        }
      } else {
        timer.cancel();
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