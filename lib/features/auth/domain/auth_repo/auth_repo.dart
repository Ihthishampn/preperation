abstract class AuthRepo {
  Future<void> signUp({required String username,required String email,required String password});
  Future<void> login({required String email,required String password});
}
