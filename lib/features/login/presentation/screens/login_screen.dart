import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inter/core/dio_client.dart/dio_client.dart';
import 'package:inter/features/login/data/useCase/login_use_case.dart';
import 'package:inter/features/login/presentation/widgets/my_text_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            // email
            const SizedBox(height: 20),
            MyTextFields(hint: "Email", suffix: false),
            const SizedBox(height: 20),
            // pass
            MyTextFields(hint: "Password", suffix: true),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  const Color.fromARGB(255, 85, 34, 157),
                ),
              ),
              onPressed: () async {
                await LoginUseCase(
                  DioClient(),
                ).loginUseCase(username: "emilys", password: "emilyspass");
              },
              child: Text("Login", style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  const Color.fromARGB(255, 85, 34, 157),
                ),
              ),
              onPressed: () async {
                SharedPreferences _pref = await SharedPreferences.getInstance();
                log(_pref.getString("accessToken").toString());
              },
              child: Text(
                "sharedPrefrence",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
