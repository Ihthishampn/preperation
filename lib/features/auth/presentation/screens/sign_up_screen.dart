import 'package:flutter/material.dart';
import 'package:inter/features/auth/presentation/screens/login_screen.dart';
import 'package:inter/features/auth/presentation/widgets/my_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 21),
        title: Text("Sign up", style: TextStyle(fontWeight: .bold)),
      ),

      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [
            MyTextField(
              controller: usernameController,
              fieldState: (value) {
                if (value == null || value.isEmpty) {
                  return "username is required";
                } else {
                  return null;
                }
              },
              hint: "Username",
            ),

            MyTextField(
              controller: emailController,
              fieldState: (value) {
                if (value == null || value.isEmpty) {
                  return "email is required";
                } else {
                  return null;
                }
              },
              hint: "Email",
            ),

            MyTextField(
              controller: passwordController,
              fieldState: (value) {
                if (value == null || value.isEmpty) {
                  return "password is required";
                } else {
                  return null;
                }
              },
              hint: "password",
            ),

            const SizedBox(height: 17),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {}
              },
              child: Text("Sign Up"),
            ),

            const SizedBox(height: 17),

            Row(
              mainAxisAlignment: .center,
              children: [
                Text(
                  "Already signed ? try",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text("login here"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
