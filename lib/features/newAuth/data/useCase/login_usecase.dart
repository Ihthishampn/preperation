import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:inter/features/core/dio_client.dart/dio_client.dart';
import 'package:inter/features/newAuth/data/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUsecaseNew {
  final DioClientnew dio;
  LoginUsecaseNew(this.dio);

  Future<LoginModel> loginUseCase({
    required String username,
    required String password,
  }) async {
    try {
      final Response res = await dio.dio.post(
        "login",
        data: {"username": username, "password": password},
      );

      final LoginModel model = LoginModel.fromJson(res.data);
      SharedPreferences pref = await SharedPreferences.getInstance();

      await pref.setString("NewAuth", model.accessToken);
      await pref.setString("NewAuthRefresh", model.refreshToken);
      log("this is the returend ${res.data}");
      return  model;
    } on DioException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
