import 'package:inter/features/core/dio_client.dart/dio_client.dart';
import 'package:inter/features/newAuth/data/repo_impl.dart/login_repo_impl.dart';
import 'package:inter/features/newAuth/data/useCase/login_usecase.dart';
import 'package:inter/features/newAuth/domain/repository/login_repository.dart';
import 'package:inter/features/newAuth/normal/dio_client_new/dio_client.dart';

final repoNew = LoginRepoImplnew(LoginUsecaseNew(DioClientnew()));
