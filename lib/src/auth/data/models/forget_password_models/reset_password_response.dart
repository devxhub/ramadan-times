import 'dart:convert';

class ResetPasswordResponse {
  final bool? success;
  final String? message;

  ResetPasswordResponse({
    this.success,
    this.message,
  });

  ResetPasswordResponse copyWith({
    bool? success,
    String? message,
  }) =>
      ResetPasswordResponse(
        success: success ?? this.success,
        message: message ?? this.message,
      );

  factory ResetPasswordResponse.fromRawJson(String str) => ResetPasswordResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) => ResetPasswordResponse(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
