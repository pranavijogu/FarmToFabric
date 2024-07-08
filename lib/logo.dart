import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/intro_to_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Onboarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: const Color.fromARGB(255, 67, 188, 84),
            child: Center(
              child: Image.asset("images/logo.jpeg", fit: BoxFit.contain),
            )));
  }
}
