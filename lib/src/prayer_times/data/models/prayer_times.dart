import 'package:intl/intl.dart';

class PrayerTimesResponse {
  final String? fajrStart;
  final String? fajrEnd;
  final String? imsakStart;
  final String? imsakEnd;
  final String? sunrise;
  final String? sunset;
  final String? dhuhrStart;
  final String? dhuhrEnd;
  final String? asrStart;
  final String? asrEnd;
  final String? maghribStart;
  final String? maghribEnd;
  final String? ishaStart;
  final String? ishaEnd;
  final String? tahajjudEnd;
  final String? sehri;
  final String? iftar;
  final String? awwabinStart;
  final String? awwabinEnd;
  final String? dawnStart;
  final String? dawnEnd;
  final String? noonStart;
  final String? noonEnd;
  final String? eveningStart;
  final String? eveningEnd;
  final DateTime? date;

  const PrayerTimesResponse({
    this.fajrStart,
    this.fajrEnd,
    this.imsakStart,
    this.imsakEnd,
    this.sunrise,
    this.sunset,
    this.dhuhrStart,
    this.dhuhrEnd,
    this.asrStart,
    this.asrEnd,
    this.maghribStart,
    this.maghribEnd,
    this.ishaStart,
    this.ishaEnd,
    this.tahajjudEnd,
    this.sehri,
    this.iftar,
    this.awwabinStart,
    this.awwabinEnd,
    this.dawnStart,
    this.dawnEnd,
    this.noonStart,
    this.noonEnd,
    this.eveningStart,
    this.eveningEnd,
    this.date,
  });
}
