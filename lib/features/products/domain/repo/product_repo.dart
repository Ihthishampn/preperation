import 'package:inter/features/products/data/model/product_model.dart';

abstract class ProductRepo {
 Future<List<ProductModel>> fetchProducts();
}
