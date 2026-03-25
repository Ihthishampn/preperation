import 'package:inter/core/dio_client/dio_client.dart';
import 'package:inter/features/products/data/model/product_model.dart';

class DataSource {
  final DioClient client;

  DataSource(this.client);

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final res = await client.dio.get("products");
      final data = res.data as List;

      return data.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Failed to fetch products");
    }
  }
}