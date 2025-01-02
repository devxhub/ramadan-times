import 'dart:convert';

class ForgetPasswordEmailSubmitResponse {
  final bool? success;
  final String? message;

  ForgetPasswordEmailSubmitResponse({
    this.success,
    this.message,
  });

  ForgetPasswordEmailSubmitResponse copyWith({
    bool? success,
    String? message,
  }) =>
      ForgetPasswordEmailSubmitResponse(
        success: success ?? this.success,
        message: message ?? this.message,
      );

  factory ForgetPasswordEmailSubmitResponse.fromRawJson(String str) => ForgetPasswordEmailSubmitResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgetPasswordEmailSubmitResponse.fromJson(Map<String, dynamic> json) => ForgetPasswordEmailSubmitResponse(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
