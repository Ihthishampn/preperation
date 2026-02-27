import 'package:flutter/material.dart';
import 'package:inter/features/login/presentation/screens/login_screen.dart';
import 'package:inter/features/newAuth/presentation/screens/home-Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splah extends StatefulWidget {
  const Splah({super.key});

  @override
  State<Splah> createState() => _SplahState();
}

class _SplahState extends State<Splah> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final String? val = pref.getString("NewAuth");
      if (val == null) {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => Homescreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text("Checking where i can go"))),
    );
  }
}
