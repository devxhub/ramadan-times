import 'package:adhan/adhan.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Write methods
Future<void> writeSelectedConvention(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('selectedConvention', value);
}

Future<void> writeFajrAngle(double value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble('fajrAngle', value);
}

Future<void> writeIshaAngle(double value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble('ishaAngle', value);
}

// Read methods
Future<String?> readSelectedConvention() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('selectedConvention');
}

Future<double?> readFajrAngle() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getDouble('fajrAngle');
}

Future<double?> readIshaAngle() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getDouble('ishaAngle');
}

CalculationMethod getCalculationMethod(String prayerConventionName) {
  switch (prayerConventionName) {
    case 'Custom Angle':
      return CalculationMethod.other;
    case 'Muslim World League':
      return CalculationMethod.muslim_world_league;
    case 'Egyptian General Authority of Survey':
      return CalculationMethod.egyptian;
    case 'University of Islamic Sciences, Karachi':
      return CalculationMethod.karachi;
    case 'Umm al-Qura University, Makkah':
      return CalculationMethod.umm_al_qura;
    case 'UAE':
      return CalculationMethod.dubai;
    case 'Moonsighting Committee':
      return CalculationMethod.moon_sighting_committee;
    case 'Singapore':
      return CalculationMethod.singapore;
    case 'ISNA method':
      return CalculationMethod.north_america;
    case 'Turkey':
      return CalculationMethod.turkey;
    case 'Tehran':
      return CalculationMethod.tehran;
    default:
      return CalculationMethod.muslim_world_league;
  }
}
