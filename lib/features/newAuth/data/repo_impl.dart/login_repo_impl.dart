import 'package:dio/dio.dart';

import 'package:inter/features/newAuth/data/model/login_model.dart';
import 'package:inter/features/newAuth/data/useCase/login_usecase.dart';
import 'package:inter/features/newAuth/domain/repository/login_repository.dart';

class LoginRepoImplnew implements LoginRepositoryNew {
  final LoginUsecaseNew remote;
  LoginRepoImplnew(this.remote);

  @override
  Future<LoginModel> loginRepository({
    required String username,
    required String password,
  }) async {
    try {
      return await remote.loginUseCase(username: username, password: password);
    } on DioException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
