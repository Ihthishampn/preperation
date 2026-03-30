import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inter/provider/product_provider.dart';

class ProductCard extends StatelessWidget {
  final ProductProvider productProvider;
  final int index;
  const ProductCard({super.key, required this.productProvider, required this.index});

  @override
  Widget build(BuildContext context) {
    final p = productProvider.products[index];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: SizedBox(
        height: 200,
        child: Row(
          mainAxisSize: .min,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 140,
                  width: 150,

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                         p.image,

                      errorWidget: (context, url, error) => Icon(Icons.error),
                      progressIndicatorBuilder: (context, url, progress) =>
                          CircularProgressIndicator(
                            padding: EdgeInsets.all(30),
                          ),
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      p.title,
                      style: TextStyle(fontWeight: .w600, fontSize: 20),
                    ),
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
p.description,                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
p.price.toString(),                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            Text(
p.rate.toString(),                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: .bold,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Color",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: .w500,
                                fontSize: 16,
                              ),
                            ),
                            colorPalette(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget colorPalette() {
    return Row(
      mainAxisAlignment: .spaceAround,
      children: [
        Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.red,
          ),
        ),
        const SizedBox(width: 5),

        Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.yellow,
          ),
        ),
        const SizedBox(width: 5),

        Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}
