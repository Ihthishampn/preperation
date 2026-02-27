import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inter/features/newAuth/app/app_state.dart';
import 'package:inter/features/newAuth/data/model/login_model.dart';
import 'package:inter/features/newAuth/domain/repository/login_repository.dart';

class NewloginProvider with ChangeNotifier {
  final LoginRepositoryNew repo;
  NewloginProvider(this.repo);
  LoginModel? dataNew;
  AppStateNew state = AppStateNew.initial;

  Future<void> handleLogin({
    required String username,
    required String password,
  }) async {
    if (state == AppStateNew.loading) return;
    state = AppStateNew.loading;
    notifyListeners();
    try {
      final data = await repo.loginRepository(
        username: username,
        password: password,
      );
      dataNew = data;

      state = AppStateNew.success;
    } on DioException catch (de) {
      state = AppStateNew.error;
      log("this is dio error bruhhh $de");
    } catch (e) {
      log("this is new auth exception errorrrrrr $e");
    }
    notifyListeners();
  }
}
