import 'package:flutter/material.dart';
import 'package:inter/features/products/presentation/provider/product_provider.dart';
import 'package:inter/features/products/presentation/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductProvider>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),

      body: Consumer<ProductProvider>(
        builder: (context, p, child) {
       if (p.state == AppState.initial || p.state == AppState.loading) {
    return const Center(child: CircularProgressIndicator());
  }

          if (p.state == AppState.error) {
            return Center(child: Text(p.error ?? "Something went wrong"));
          }

          if (p.products.isEmpty) {
            return const Center(child: Text("No products found"));
          }

          return RefreshIndicator(
            onRefresh: () => p.fetchProducts(),
            child: ListView.builder(
              itemCount: p.products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: p.products[index]);
              },
            ),
          );
        },
      ),
    );
    
  }
}