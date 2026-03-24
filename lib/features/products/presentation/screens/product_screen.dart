import 'package:flutter/material.dart';
import 'package:inter/features/products/data/model/product_model.dart';
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
  Widget build(BuildContext context) {
    final p = context.watch<ProductProvider>();

    return Scaffold(
      body: FutureBuilder<List<ProductModel>>(
        future: p.handleFetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (!snapshot.hasData) {
            return Center(child: Text("No data"));
          }
          final snaps = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              return ProductCard(pro: null);
            },
          );
        },
      ),
    );
  }
}

// UI Requirements
// - Display product image on the left
// - Show title (max 2 lines)
// - Display price prominently
// - Show rating with star icon
// - Use card-based layout with spacing and padding
