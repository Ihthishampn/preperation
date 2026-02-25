import 'package:flutter/material.dart';
import 'package:inter/features/login/presentation/widgets/my_text_fields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        height: double.infinity,
        width: double.infinity,
        child: Column(children: [


  MyTextFields(),

    ],),
      ),
    );
  }
}
