import 'package:flutter/material.dart';
import 'package:inter/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:inter/features/home/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SignUpScreen());
  }
}
