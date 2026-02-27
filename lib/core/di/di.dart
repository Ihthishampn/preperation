import 'package:inter/core/dio_client.dart/dio_client.dart';
import 'package:inter/features/login/data/repo_impl/login_repo_impl.dart';
import 'package:inter/features/login/data/useCase/login_use_case.dart';

final loginRepo = LoginRepoImpl(LoginUseCase(DioClientnew()));
