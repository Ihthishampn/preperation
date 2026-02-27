import 'package:inter/features/newAuth/data/model/login_model.dart';

abstract class LoginRepositoryNew {
  Future<LoginModel> loginRepository({required String username,required String password});
}
