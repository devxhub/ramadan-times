import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
}
