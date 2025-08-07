
class AuthModel {
  String? username;
  String? password;
  String? accessToken;
  bool? status;

  AuthModel({
    required this.username,
    required this.password,
    this.accessToken,
    this.status,
  });

  factory AuthModel.fromJson(Map<String, dynamic> jsonData) {
    final userDetails = jsonData["user_details"];
    return AuthModel(
      username: userDetails["name"],
      password: userDetails["password_text"],
      accessToken: jsonData["token"],
      status: jsonData["status"],
    );
  }
}

