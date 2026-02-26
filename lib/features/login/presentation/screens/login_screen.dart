import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inter/core/appstate/app_state.dart';

import 'package:inter/features/login/presentation/provider/login_provider.dart';
import 'package:inter/features/login/presentation/widgets/my_text_fields.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameController = TextEditingController(
    text: "emilys",
  );
  final TextEditingController passwordController = TextEditingController(
    text: "emilyspass",
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.blueAccent,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              // email
              const SizedBox(height: 20),
              MyTextFields(
                hint: "Email",
                suffix: false,
                controller: userNameController,
              ),
              const SizedBox(height: 20),
              // pass
              MyTextFields(
                hint: "Password",
                suffix: true,
                controller: passwordController,
              ),

              const SizedBox(height: 20),

              Consumer<LoginProvider>(
                builder: (context, provider, child) => ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 85, 34, 157),
                    ),
                  ),
                  onPressed: () async {
                    if (userNameController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      log("all feilds are required");
                      return;
                    }
                    await provider.hanldleLogin(
                      userName: userNameController.text,
                      password: passwordController.text,
                    );
                    log("this funtion was runned");

                    if (provider.state == AppState.success) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text("Success")));
                        userNameController.clear();
                        passwordController.clear();
                      });
                    }
                  },
                  child: provider.state == AppState.loading
                      ? CircularProgressIndicator()
                      : Text("Login", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
