import 'package:adhan/adhan.dart';
import 'package:ramadantimes/src/prayer_times/data/models/prayer_convention_model.dart';

List<PrayerConventionModel> prayerConventionList = [
  PrayerConventionModel(
    calculationMethod: CalculationMethod.other,
    fajrAngle: 0.0,
    ishaAngle: 0.0,
    conventionName: 'Custom Angle',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.muslim_world_league,
    fajrAngle: 18,
    ishaAngle: 17,
    conventionName: 'Muslim World League',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.egyptian,
    fajrAngle: 19.5,
    ishaAngle: 17.5,
    conventionName: 'Egyptian General Authority of Survey',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.karachi,
    fajrAngle: 18,
    ishaAngle: 18,
    conventionName: 'University of Islamic Sciences, Karachi',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.umm_al_qura,
    fajrAngle: 18,
    ishaAngle: 90,
    conventionName: 'Umm al-Qura University, Makkah',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.dubai,
    fajrAngle: 18.2,
    ishaAngle: 18.2,
    conventionName: 'UAE',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.kuwait,
    fajrAngle: 18.0,
    ishaAngle: 17.5,
    conventionName: 'Kuwait',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.moon_sighting_committee,
    fajrAngle: 18.0,
    ishaAngle: 18.0,
    conventionName: 'Moonsighting Committee',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.singapore,
    fajrAngle: 20.0,
    ishaAngle: 18.0,
    conventionName: 'Singapore',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.north_america,
    fajrAngle: 15.0,
    ishaAngle: 15.0,
    conventionName: 'ISNA method',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.turkey,
    fajrAngle: 18.0,
    ishaAngle: 17.0,
    conventionName: 'Turkey',
  ),
];
