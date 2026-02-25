import 'package:inter/features/login/data/model/autha_model.dart';

abstract class LoginRepository {



Future<AuthaModel> loginUser({
    required String username,
    required String password,
  });


}