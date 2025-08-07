// class AuthModel {
//   String? email;
//   String? password;
//   String? accessToken;
//   String? status;

//   AuthModel({required this.email, required this.password, this.accessToken,this.status});

//   factory AuthModel.fromJson(Map<String, dynamic> jsonData) {
//     return AuthModel(
//       email: jsonData["username"],
//       password: jsonData["password_text"],
//       accessToken: jsonData["token"],
//       status: jsonData["status"]
//     );
//   }
// }

class AuthModel {
  String? name;
  String? password;
  String? accessToken;
  bool? status;

  AuthModel({
    required this.name,
    required this.password,
    this.accessToken,
    this.status,
  });

  factory AuthModel.fromJson(Map<String, dynamic> jsonData) {
    final userDetails = jsonData["user_details"];
    return AuthModel(
      name: userDetails["username"],
      password: userDetails["password_text"],
      accessToken: jsonData["token"],
      status: jsonData["status"],
    );
  }
}

