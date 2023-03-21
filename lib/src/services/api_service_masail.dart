import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ramadantimes/src/bloc/network_exceptions.dart';
import 'package:ramadantimes/src/models/masail/masail/masail.dart';
import 'package:ramadantimes/src/models/timing/timing.dart';

import '../bloc/api_result.dart';
import '../models/address/district.dart';
import '../models/calendar_model/calendar_model.dart';
import 'dio_client.dart';

class MasailApiServices {
  late DioClient dioClient;

  MasailApiServices() {
    var dio = Dio();

    dioClient = DioClient("https://ramadan.devxhub.com", dio);
  }
  Future<Masail> getAllMaslaMasail({int limit = 15, page = 1}) async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      final response = await dioClient.get(
        "/masalas?limit=$limit&page=1",
      );

      return Masail.fromJson(response);
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
