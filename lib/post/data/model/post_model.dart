class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel({
    required this.body,
    required this.id,
    required this.title,
    required this.userId,
  });

  // from server

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      body: json["body"],
      id: json["id"],
      title: json["title"],
      userId: json["userId"],
    );
  }
}
