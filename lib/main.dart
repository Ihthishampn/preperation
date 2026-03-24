import 'package:flutter/material.dart';
import 'package:inter/core/di/di.dart';
import 'package:inter/features/products/presentation/provider/product_provider.dart';

import 'package:inter/features/products/presentation/screens/product_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    
    providers: [

ChangeNotifierProvider(create: (context) => ProductProvider(productRepoDi),)
    ],

    child: App()));
}



class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    
    home:  ProductScreen(),
    
    );
  }
}