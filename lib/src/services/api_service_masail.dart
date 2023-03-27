import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ramadantimes/src/models/masail/masail/masail.dart';

import 'dio_client.dart';

class MasailApiServices {
  late DioClient dioClient;

  MasailApiServices() {
    var dio = Dio();

    dioClient = DioClient("https://ramadan.devxhub.com", dio);
  }
  Future<Masail> getAllMaslaMasail({int limit = 10, offset = 1}) async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      final response = await dioClient.get(
        "/masalas?limit=$limit&offset=$offset",
      );

      return Masail.fromJson(response);
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
