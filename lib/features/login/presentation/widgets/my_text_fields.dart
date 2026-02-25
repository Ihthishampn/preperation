import 'package:flutter/material.dart';
import 'package:inter/features/login/presentation/provider/obscure_provider.dart';
import 'package:provider/provider.dart';

class MyTextFields extends StatelessWidget {
  final bool? suffix;
  final String hint;
  const MyTextFields({super.key, required this.hint, this.suffix});

  @override
  Widget build(BuildContext context) {
    return Consumer<ObscureProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: value.obscure,

            decoration: InputDecoration(
              suffixIcon: suffix == true
                  ? IconButton(
                      onPressed: () {
                        value.changeObscure();
                      },
                      icon: value.obscure
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    )
                  : null,
              hintText: hint,
            ),
          ),
        );
      },
    );
  }
}
