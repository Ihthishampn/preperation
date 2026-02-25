import 'package:dio/dio.dart';
import 'package:inter/features/login/data/model/autha_model.dart';
import 'package:inter/features/login/data/useCase/login_use_case.dart';
import 'package:inter/features/login/domain/login_repository.dart';

class LoginRepoImpl implements LoginRepository {
  final LoginUseCase remote;
  LoginRepoImpl(this.remote);

  @override
  Future<AuthaModel> loginUser({
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
