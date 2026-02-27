import 'package:flutter/material.dart';

class MyTextFormFeild extends StatelessWidget {
  final String name;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;

  const MyTextFormFeild({
    super.key, required this.name, required this.validator, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
      controller:controller ,
      validator: validator,
      
      
      decoration: InputDecoration(label: Text(name)),
      
      
      
      
      
      ),
    );
  }
}
