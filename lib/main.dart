import 'package:flutter/material.dart';
import 'package:inter/core/di/di.dart';
import 'package:inter/features/login/presentation/provider/login_provider.dart';
import 'package:inter/features/login/presentation/provider/obscure_provider.dart';
import 'package:inter/features/login/presentation/screens/login_screen.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp( MultiProvider(

//     providers: [
//       ChangeNotifierProvider(create: (context) => ObscureProvider(),),
//       ChangeNotifierProvider(create: (context) => LoginProvider(loginRepo),)
//       ],
//     child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return MaterialApp(

//       debugShowCheckedModeBanner: false,

//       home: LoginScreen(),);
//   }
// }

// new authhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


debugShowCheckedModeBanner: false,
home: null,

    );
  }
}