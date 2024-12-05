import 'package:adhan/adhan.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _box = GetStorage();

Future<void> writeSelectedConvention(String value) =>
    _box.write('selectedConvention', value);
Future<void> writeFajrAngle(double value) => _box.write('fajrAngle', value);
Future<void> writeIshaAngle(double value) => _box.write('ishaAngle', value);

String readSelectedConvention() => _box.read('selectedConvention');
double readFajrAngle() => _box.read('fajrAngle');
double readIshaAngle() => _box.read('ishaAngle');

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
