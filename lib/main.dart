import 'package:flutter/material.dart';
import 'package:inter/core/dio_client/dio_client.dart';
import 'package:inter/provider/product_provider.dart';
import 'package:inter/screens/product_screen.dart';
import 'package:inter/services/product_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      
      ChangeNotifierProvider(create: (context) => ProductProvider(ProductService(DioClient())),)],
    
    child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    );
  }
}
