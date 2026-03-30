import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inter/core/app/app_state.dart';
import 'package:inter/model/product_model.dart';
import 'package:inter/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  final ProductService service;
  ProductProvider(this.service);
  AppState state = AppState.initial;
  String? error;
  List<ProductModel> products = [];

  Future<void> handleFetchData() async {
    if (state == AppState.loading) return;
    state = AppState.loading;
    error = null;
    notifyListeners();

    try {
      final res = await service.fetchProduct();
      products.addAll(res);
      state = AppState.success;
      log("all done");
    } catch (e) {
      log("e from p $e");
      state == AppState.error;
    }
    notifyListeners();
  }
}
