import 'package:flutter/material.dart';

class MyTextFields extends StatelessWidget {
  const MyTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(

keyboardType: TextInputType.emailAddress,





      decoration: InputDecoration(
hintText: "Email",






      ),
    );
  }
}