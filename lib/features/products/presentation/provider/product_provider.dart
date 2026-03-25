import 'package:flutter/material.dart';
import 'package:inter/features/products/data/model/product_model.dart';
import 'package:inter/features/products/domain/repo/product_repo.dart';

enum AppState { initial, loading, success, error }

class ProductProvider extends ChangeNotifier {
  final ProductRepo repo;

  ProductProvider(this.repo);

  List<ProductModel> products = [];
  AppState state = AppState.initial;
  String? error;

  Future<void> fetchProducts() async {
    state = AppState.loading;
    notifyListeners();

    try {
      products = await repo.fetchProducts();
      state = AppState.success;
    } catch (e) {
      state = AppState.error;
      error = e.toString();
    }

    notifyListeners();
  }
}