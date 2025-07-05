class AuthModel {
  final String message;
  final String status;

  AuthModel(this.message, this.status);

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(json["message"], json["status"]);
  }
}
