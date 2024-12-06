import 'package:adhan/adhan.dart';

class PrayerConventionModel {
  final CalculationMethod calculationMethod;
  final double fajrAngle;
  final double ishaAngle;
  final String prayerConventionName;

  PrayerConventionModel({
    required this.calculationMethod,
    required this.fajrAngle,
    required this.ishaAngle,
    required this.prayerConventionName,
  });
}
