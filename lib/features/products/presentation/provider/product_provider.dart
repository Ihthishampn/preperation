import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inter/core/app_state/app_state.dart';
import 'package:inter/features/products/data/model/product_model.dart';
import 'package:inter/features/products/domain/repo/product_repo.dart';

class ProductProvider with ChangeNotifier {
  final ProductRepo repo;
  ProductProvider(this.repo);

  AppState state = AppState.initial;
 // List<ProductModel> productsList = [];

 // String? error;

  // Future<void> handleFetch() async {
  //   if (state == AppState.loading) return;

  //   state = AppState.loading;
  //   error = null;
  //   notifyListeners();

  //   try {
  //     final res = await repo.fetchProducts();
  //     productsList.addAll(res);

  //     state = AppState.success;
  //   } catch (e) {
  //     state = AppState.error;
  //     error = "$e";
  //     log("this is a ex from provider file while fetching products $e");
  //   }
  //   notifyListeners();
  // }

  Future<List<ProductModel>> handleFetch() async {
    return await repo.fetchProducts();
  }
}
