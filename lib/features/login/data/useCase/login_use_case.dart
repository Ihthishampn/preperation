import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:inter/core/dio_client.dart/dio_client.dart';
import 'package:inter/features/login/data/model/autha_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUseCase {
  final DioClient dio;
  LoginUseCase(this.dio);

  Future<AuthaModel> loginUseCase({
    required String username,
    required String password,
  }) async {
    try {
      final user = await dio.dio.post(
        "login",
        data: {"username": username, "password": password},
      );
    
      log(user.data.toString());
      final AuthaModel model = AuthaModel.fromJson(user.data);
  final SharedPreferences _pref = await SharedPreferences.getInstance();
      _pref.setString("accessToken", model.accessToken);
      _pref.setString("refreshToken", model.refreshToken);
      return model;
    } on DioException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}



// on DioException catch (e) {
//       log("Dio error: ${e.type}");

//       if (e.type == DioExceptionType.connectionError) {
//         throw Exception("No internet connection");
//       }

//       if (e.type == DioExceptionType.badResponse) {
//         final statusCode = e.response?.statusCode;

//         if (statusCode == 401) {
//           throw Exception("Invalid credentials");
//         }

//         if (statusCode == 500) {
//           throw Exception("Server error");
//         }
//       }