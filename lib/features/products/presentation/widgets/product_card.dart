import 'package:flutter/material.dart';
import 'package:inter/features/products/presentation/provider/product_provider.dart';

class ProductCard extends StatelessWidget {
  final ProductProvider? pro;
  const ProductCard({super.key, required this.pro});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // image left
          Column(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                  "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
                ),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .end,
            children: [
              Text(
                maxLines: 2,
                "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                style: TextStyle(fontWeight: .bold),
              ),

              Text("\$50", style: TextStyle(fontWeight: .bold)),
              Text("rating", style: TextStyle(fontWeight: .bold)),
              Icon(Icons.star),
            ],
          ),
        ],
      ),
    );
  }
}
