import 'dart:developer';

import 'package:inter/core/dio_client/dio_client.dart';
import 'package:inter/model/product_model.dart';

class ProductService {
  final DioClient dio;
  ProductService(this.dio);

  // fetch

  Future<List<ProductModel>> fetchProduct() async {
    try {
      final res = await dio.dio.get("products");
      log("res code ${res.statusCode}");
      final List data = res.data;
      log("data of fetched form service class ${data.toString()}");

      return data.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
