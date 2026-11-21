class AuthModel {
  final bool status;
  final String message;

  AuthModel({required this.status, required this.message});

  factory AuthModel.fromjson(Map<String, dynamic> json) {
    return AuthModel(
      status: json["status"] ?? false,
      message: json["message"] ?? "",
    );
  }
}