import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final FormFieldValidator<String> fieldState;
  const MyTextField({
    super.key,
    required this.hint,
    required this.fieldState,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        controller: controller,
        scrollPadding: EdgeInsets.all(12),
        validator: fieldState,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
