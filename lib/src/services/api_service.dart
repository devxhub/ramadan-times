import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ramadantimes/src/bloc/network_exceptions.dart';
import 'package:ramadantimes/src/models/timing/timing.dart';

import '../bloc/api_result.dart';
import '../models/address/district.dart';
import '../models/calendar_model/calendar_model.dart';
import 'dio_client.dart';

class ApiServices {
  late DioClient dioClient;

  ApiServices() {
    var dio = Dio();

    dioClient = DioClient("https://api.aladhan.com/v1", dio);
  }
  Future<CalendarModel> calendarByCity(
      {required int year,
      required int month,
      required String city,
      required String? country,
      int method = 2,
      int school = 1}) async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      final response = await dioClient.get(
        "/calendarByCity/$year/$month?city=$city&country=$country&method=$method&school=$school",

        // queryParameters: {"per_page": 4},
      );
      CalendarModel calendar = CalendarModel.fromJson(response);

      return calendar;
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<Timing> timingByCity(
      {required String date,
      required String city,
      required String? country,
      int method = 2,
      school = 1}) async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      final response = await dioClient.get(
        "/timingsByCity/$date?city=$city&country=$country&method=$method&school=$school",

        // queryParameters: {"per_page": 4},
      );
      Timing calendar = Timing.fromJson(response);

      return calendar;
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<ApiResult<Timing>> timingsByCityCubit(
      {required String date,
      required String city,
      required String? country,
      int method = 2,
      school = 1}) async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      final response = await dioClient.get(
        "/timingsByCity/$date?city=$city&country=$country&method=$method&school=$school",

        // queryParameters: {"per_page": 4},
      );
      Timing calendar = Timing.fromJson(response);

      return ApiResult.success(data: calendar);
    } on NetworkExceptions catch (e) {
      debugPrint(e.toString());

      return ApiResult.failure(error: e);
    }
  }

  Future<ApiResult<List<District>>> fetchUpazilaByDistrictId() async {
    try {
      var response =
          await rootBundle.loadString('assets/locations/districts.json');
      final map = jsonDecode(response);

      List<District>? upazilas = (map as List)
          .map((e) =>
              e == null ? null : District.fromJson(e as Map<String, dynamic>))
          .cast<District>()
          .toList();

      return ApiResult.success(data: upazilas);
    } catch (e) {
      rethrow;
    }
  }
}
