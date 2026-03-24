import 'dart:developer';

import 'package:inter/core/dio_client/dio_client.dart';
import 'package:inter/features/products/data/model/product_model.dart';

class DataSource {
  final DioClient dio;
  DataSource(this.dio);

  Future<List<ProductModel>> fetchDataSouece() async {
    try {
      final res = await dio.dio.get("products");
      final data = (res.data as List);
      log(data.toString());

      return data.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
