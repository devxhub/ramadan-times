import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:muslimtimespro/src/auth/data/models/forget_password_models/forget_password_email_submit_response.dart';
import 'package:muslimtimespro/src/auth/data/models/forget_password_models/forget_password_otp_submit_response.dart';
import 'package:muslimtimespro/src/auth/data/models/forget_password_models/reset_password_response.dart';
import '../../../services/dio_client.dart';
import 'package:http/http.dart' as http;
import '../models/sign_in_response.dart';

class SignInRepository {
  late DioClient dioClient;
  final String _baseUrl = "";

  SignInRepository() {
    var dio = Dio();
    dioClient = DioClient(_baseUrl, dio);
  }
  Future<SignInResponse> signInDataSubmit(
      {required String email, required String password}) async {
    try {
      final resp = await dioClient.post("$_baseUrl/auth/login", data: {
        "email": email,
        "password": password,
      });
      SignInResponse loginResponse =
          SignInResponse.fromRawJson(jsonEncode(resp));
      return loginResponse;
    } catch (e) {
      if (kDebugMode) {
        print("Errror is $e");
      }
      rethrow;
    }
  }

Future<ForgetPasswordEmailSubmitResponse> forgetPasswordEmailSubmit(
      {required String email}) async {
    try {
      final resp = await dioClient.post("$_baseUrl/auth/forget_password", data: {
        "email": email,
      });
      ForgetPasswordEmailSubmitResponse forgetPasswordEmailSubmitResponse =
      ForgetPasswordEmailSubmitResponse.fromRawJson(jsonEncode(resp));
      return forgetPasswordEmailSubmitResponse;
    } catch (e) {
      if (kDebugMode) {
        print("Errror is $e");
      }
      rethrow;
    }
  }
  Future<ForgetPasswordOtpSubmitResponse> forgetPasswordOtpSubmit(
      {required String email, required String otp}) async {
    try {
      final resp = await dioClient.post("$_baseUrl/auth/forget_password/verify_otp", data: {
        "email": email,
        "otp": otp,
      });
      ForgetPasswordOtpSubmitResponse forgetPasswordOtpSubmitResponse =
      ForgetPasswordOtpSubmitResponse.fromRawJson(jsonEncode(resp));
      return forgetPasswordOtpSubmitResponse ;
    } catch (e) {
      if (kDebugMode) {
        print("Errror is $e");
      }
      rethrow;
    }
  }
 Future<ResetPasswordResponse>resetPassword(
      {required String email, required String password}) async {
    try {
      final resp = await dioClient.post("$_baseUrl/auth/login", data: {
        "email": email,
        "password": password,
      });
      ResetPasswordResponse resetPasswordResponse=
      ResetPasswordResponse.fromRawJson(jsonEncode(resp));
      return resetPasswordResponse;
    } catch (e) {
      if (kDebugMode) {
        print("Errror is $e");
      }
      rethrow;
    }
  }
}
