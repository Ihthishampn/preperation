import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inter/features/newAuth/app/app_state.dart';
import 'package:inter/features/newAuth/presentation/provider/newlogin_provider.dart';
import 'package:inter/features/newAuth/presentation/screens/home-Screen.dart';
import 'package:provider/provider.dart';

import '../widgets/my_text_form_field.dart';

class LoginNewScreen extends StatefulWidget {
  const LoginNewScreen({super.key});

  @override
  State<LoginNewScreen> createState() => _LoginNewScreenState();
}

class _LoginNewScreenState extends State<LoginNewScreen> {
  final TextEditingController userNameCOntroller = TextEditingController(text: "emilys");
  final TextEditingController passwordController = TextEditingController(text: "emilyspass");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Form(
          key: formKey,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.cyan,

            child: Column(
              children: [
                const SizedBox(height: 20),

                MyTextFormFeild(
                  name: "UserName",
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "UserName must be filled, its required like water in daily life";
                    }
                  },
                  controller: userNameCOntroller,
                ),
                const SizedBox(height: 20),
                MyTextFormFeild(
                  name: "Password",
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "password must be filled, without its how can we trust you , are u scammer !!!";
                    }
                  },
                  controller: passwordController,
                ),

                //
                Consumer<NewloginProvider>(
                  builder: (context, value, child) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll<Color>(
                          Colors.black,
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          log("done");
                          value.handleLogin(
                            username: userNameCOntroller.text,
                            password: passwordController.text,
                          );
                          if (value.state == AppStateNew.success) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Homescreen(),
                              ),
                            );
                          }
                        } else {}
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
