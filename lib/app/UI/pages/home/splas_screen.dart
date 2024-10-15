import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      // Navigate to the next screen after 5 seconds
      Get.offNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'BestSelf',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 20.0),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

