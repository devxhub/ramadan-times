import 'dart:convert';

class SignUpResponse {
  final bool? success;
  final String? message;

  SignUpResponse({
    this.success,
    this.message,
  });

  SignUpResponse copyWith({
    bool? success,
    String? message,
  }) =>
      SignUpResponse(
        success: success ?? this.success,
        message: message ?? this.message,
      );

  factory SignUpResponse.fromRawJson(String str) =>
      SignUpResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
