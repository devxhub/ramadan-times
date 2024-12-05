import 'dart:convert';

import 'package:adhan/adhan.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:ramadantimes/src/prayer_times/data/models/country_response.dart';
import 'package:ramadantimes/src/prayer_times/data/models/prayer_times.dart';
import 'package:ramadantimes/src/prayer_times/data/models/weather_model.dart';
import '../../../services/dio_client.dart';
import 'package:http/http.dart' as http;

class PrayerTimeRepository {
  late DioClient dioClient;
  final String _baseUrl = "";

  PrayerTimeRepository() {
    var dio = Dio();
    dioClient = DioClient(_baseUrl, dio);
  }

  Future<PrayerTimesResponse> generatePrayerTimes({
    required double latitude,
    required double longitude,
    required date,
    required CalculationMethod calculationMethod,
    required double fajrAngle,
    required double ishaAngle,
  }) async {
    if (latitude.isFinite) {
      final coordinates = Coordinates(latitude, longitude);
      CalculationParameters calculationParams =
          getCalculationParameters(calculationMethod, fajrAngle, ishaAngle);

      try {
        final date = DateTime.now();

        final prayerTimesForDay = PrayerTimes(
            coordinates,
            DateComponents(date.year, date.month, date.day),
            calculationParams); // 5 mins before and after Dhuhr
        final tahajjudEnd = prayerTimesForDay.fajr
            .subtract(Duration(minutes: 10)); // End 10 minutes before Fajr

        ///fazr
        final imsakStart=prayerTimesForDay.fajr.subtract(Duration(minutes: 10));
        final imsakend=prayerTimesForDay.fajr.subtract(Duration(minutes: 1));
        final fajrStart = prayerTimesForDay.fajr;
        final fajrEnd = prayerTimesForDay.sunrise;
        final dhuhrStart = prayerTimesForDay.dhuhr;
        final dhuhrEnd = prayerTimesForDay.asr; // Dhuhr ends at Asr
        final asrStart = prayerTimesForDay.asr;
        final asrEnd = prayerTimesForDay.maghrib; // Asr ends at Maghrib
        final maghribStart = prayerTimesForDay.maghrib;
        final maghribEnd = prayerTimesForDay.isha; // Maghrib ends at Isha
        final ishaStart = prayerTimesForDay.isha;
        final ishaEnd = prayerTimesForDay.fajr.add(Duration(days: 1));
        final awwabinStart = prayerTimesForDay.maghrib
            .add(Duration(minutes: 5)); // Start 5 minutes after Maghrib
        final awwabinEnd = prayerTimesForDay
            .isha; // Ends at Isha time// Isha ends at Fajr of the next day
        ///sun
        final sunrise = prayerTimesForDay.sunrise;
        final sunset = prayerTimesForDay.maghrib;

        final year = prayerTimesForDay.dateComponents.year;
        final month = prayerTimesForDay.dateComponents.month;
        final day = prayerTimesForDay.dateComponents.day;

        ///prohibitted time

        final dawnStart = fajrEnd;
        final dawnEnd = fajrEnd.add(Duration(minutes: 15));
        final noonStart = dhuhrStart.subtract(Duration(minutes: 8));
        final noonEnd = dhuhrStart;
        final eveningStart = maghribStart.subtract(Duration(minutes: 19));
        final eveningEnd = maghribStart.subtract(Duration(minutes: 4));
        return PrayerTimesResponse(
          fajrStart: fajrStart.toString(),
          fajrEnd: fajrEnd.toString(),
          imsakStart: imsakStart.toString(),
          imsakEnd: imsakend.toString(),
          sunrise: sunrise.toString(),
          sunset: sunset.toString(),
          dhuhrStart: dhuhrStart.toString(),
          dhuhrEnd: dhuhrEnd.toString(),
          asrStart: asrStart.toString(),
          asrEnd: asrEnd.toString(),
          maghribStart: maghribStart.toString(),
          maghribEnd: maghribEnd.toString(),
          ishaStart: ishaStart.toString(),
          ishaEnd: ishaEnd.toString(),
          sehri: fajrStart.toString(),
          iftar: maghribStart.toString(),
          awwabinStart: awwabinStart.toString(),
          awwabinEnd: awwabinEnd.toString(),
          dawnStart: dawnStart.toString(),
          dawnEnd: dawnEnd.toString(),
          noonStart: noonStart.toString(),
          noonEnd: noonEnd.toString(),
          eveningStart: eveningStart.toString(),
          eveningEnd: eveningEnd.toString(),
          tahajjudEnd: tahajjudEnd.toString(),
          date: DateTime(year, month, day),
        );
      } catch (e) {
        rethrow;
      }
    } else {
      return PrayerTimesResponse();
    }
  }

  Future<CountryResponse> countryResponseDataLoaded() async {
    try {
      var response =
          await rootBundle.loadString('assets/locations/countries.json');
      final map = jsonDecode(response);
      return CountryResponse.fromJson(map);
    } catch (e) {
      rethrow;
    }
  }

  Future<WeatherModel> fetchWeatherData(
      String latitude, String longitude) async {
    String weatherUrl =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=f92bf340ade13c087f6334ed434f9761&fbclid=IwAR2MIhWnKnisutHJ1y1dgxc-XbFFbVlG_T_f8F9_fhd6ZFC4PRI3oNAWgMc";

    final response = await http.get(Uri.parse(weatherUrl));

    return WeatherModel.fromRawJson(response.body);
  }

  CalculationParameters getCalculationParameters(
      CalculationMethod calculationMethod, double fajrAngle, double ishaAngle) {
    switch (calculationMethod) {
      case CalculationMethod.other:
        return CalculationParameters(
          method: calculationMethod,
          fajrAngle:
              calculationMethod == CalculationMethod.other ? fajrAngle : 0.0,
          ishaAngle:
              calculationMethod == CalculationMethod.other ? ishaAngle : 0.0,
          ishaInterval: 0,
        );
      case CalculationMethod.muslim_world_league:
        return CalculationMethod.muslim_world_league.getParameters();
      case CalculationMethod.egyptian:
        return CalculationMethod.egyptian.getParameters();
      case CalculationMethod.karachi:
        return CalculationMethod.karachi.getParameters();
      case CalculationMethod.umm_al_qura:
        return CalculationMethod.umm_al_qura.getParameters();
      case CalculationMethod.kuwait:
        return CalculationMethod.kuwait.getParameters();
      case CalculationMethod.moon_sighting_committee:
        return CalculationMethod.moon_sighting_committee.getParameters();
      case CalculationMethod.singapore:
        return CalculationMethod.singapore.getParameters();
      case CalculationMethod.north_america:
        return CalculationMethod.north_america.getParameters();
      case CalculationMethod.turkey:
        return CalculationMethod.turkey.getParameters();

      default:
        return CalculationMethod.muslim_world_league.getParameters();
    }
  }
}
