import 'package:flutter/material.dart';
import 'package:inter/provider/product_provider.dart';

class CategoryHorizontalCards extends StatelessWidget {
  final ProductProvider provider;
  final int index;
  const CategoryHorizontalCards({super.key, required this.provider, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        height: 150,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 232, 117, 82),
              ),
              child: Icon(
                Icons.add_circle_outline_sharp,
                color: Colors.white,
                size: 70,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              provider.products[index].category,
              style: TextStyle(
                fontWeight: .w500,
                fontSize: 16,
                color: const Color.fromARGB(255, 119, 118, 118),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
