import 'package:adhan/adhan.dart';
import 'package:muslimtimespro/src/prayer_times/data/models/prayer_convention_model.dart';

List<PrayerConventionModel> prayerConventionList = [
  PrayerConventionModel(
    calculationMethod: CalculationMethod.other,
    fajrAngle: 0.0,
    ishaAngle: 0.0,
    prayerConventionName: 'Custom Angle',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.muslim_world_league,
    fajrAngle: 18,
    ishaAngle: 17,
    prayerConventionName: 'Muslim World League',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.egyptian,
    fajrAngle: 19.5,
    ishaAngle: 17.5,
    prayerConventionName: 'Egyptian General Authority of Survey',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.karachi,
    fajrAngle: 18,
    ishaAngle: 18,
    prayerConventionName: 'University of Islamic Sciences, Karachi',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.umm_al_qura,
    fajrAngle: 18,
    ishaAngle: 90,
    prayerConventionName: 'Umm al-Qura University, Makkah',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.dubai,
    fajrAngle: 18.2,
    ishaAngle: 18.2,
    prayerConventionName: 'UAE',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.kuwait,
    fajrAngle: 18.0,
    ishaAngle: 17.5,
    prayerConventionName: 'Kuwait',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.moon_sighting_committee,
    fajrAngle: 18.0,
    ishaAngle: 18.0,
    prayerConventionName: 'Moonsighting Committee',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.singapore,
    fajrAngle: 20.0,
    ishaAngle: 18.0,
    prayerConventionName: 'Singapore',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.north_america,
    fajrAngle: 15.0,
    ishaAngle: 15.0,
    prayerConventionName: 'ISNA method',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.turkey,
    fajrAngle: 18.0,
    ishaAngle: 17.0,
    prayerConventionName: 'Turkey',
  ),
  PrayerConventionModel(
    calculationMethod: CalculationMethod.turkey,
    fajrAngle: 17.7,
    ishaAngle: 14,
    prayerConventionName: 'Tehran',
  ),
];
