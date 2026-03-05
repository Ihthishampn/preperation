import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFD4DCFF),
              Color(0x00FFFFFF), // transparent
              Color(0xFFD4DCFF),
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            "assets/images/logo.png",
            width: 150,
          ),
        ),
      ),
    );
  }
}