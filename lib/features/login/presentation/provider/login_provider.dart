import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inter/core/appstate/app_state.dart';
import 'package:inter/features/login/data/model/autha_model.dart';
import 'package:inter/features/login/domain/login_repository.dart';

class LoginProvider with ChangeNotifier {
  final LoginRepository repo;
  LoginProvider(this.repo);

  AppState state = AppState.initial;
  String? error;
  AuthaModel? model;

  Future<void> hanldleLogin({
    required String userName,
    required String password,
  }) async {
    if (state == AppState.loading) return;
    state = AppState.loading;
    error = null;
    notifyListeners();

    try {
      await repo.loginUser(username: userName, password: password);
      state = AppState.success;
      log("Success");
    } catch (e) {
      state = AppState.error;
      log("Errorrrrrrrrrrrr ::: $e");
    }
    notifyListeners();
  }
}
