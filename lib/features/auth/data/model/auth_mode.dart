class AuthModel {
  final int id;
  final String username;
  final String email;

  AuthModel({
    required this.id,
    required this.username,
    required this.email,
  });

  // to firebase

  Map<String, dynamic> toFirebase() {
    return {"id": id, "username": username, "email": email};
  }

  // from firebase

  factory AuthModel.fromFirebase(Map<String, dynamic> fromFirebase) {
    return AuthModel(
      id: fromFirebase["id"],
      username: fromFirebase["username"],
      email: fromFirebase['email'],
    );
  }
}
