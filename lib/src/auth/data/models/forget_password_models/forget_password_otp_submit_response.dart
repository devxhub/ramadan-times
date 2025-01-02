import 'dart:convert';

class ForgetPasswordOtpSubmitResponse {
  final bool? success;
  final String? message;

  ForgetPasswordOtpSubmitResponse({
    this.success,
    this.message,
  });

  ForgetPasswordOtpSubmitResponse copyWith({
    bool? success,
    String? message,
  }) =>
      ForgetPasswordOtpSubmitResponse(
        success: success ?? this.success,
        message: message ?? this.message,
      );

  factory ForgetPasswordOtpSubmitResponse.fromRawJson(String str) => ForgetPasswordOtpSubmitResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgetPasswordOtpSubmitResponse.fromJson(Map<String, dynamic> json) => ForgetPasswordOtpSubmitResponse(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
