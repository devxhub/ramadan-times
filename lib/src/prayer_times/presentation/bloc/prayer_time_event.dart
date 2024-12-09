part of 'prayer_time_bloc.dart';

@freezed
class PrayerTimeEvent with _$PrayerTimeEvent {
  const factory PrayerTimeEvent.prayerTimesDataLoaded({
    required double latitude,
    required double longitude,
  }) = _PrayerTimesDataLoaded;
  const factory PrayerTimeEvent.countryDataLoaded() = _CountryDataLoaded;
  const factory PrayerTimeEvent.locationPermission(
      {required BuildContext context}) = _LocationPermission;
  const factory PrayerTimeEvent.selectCountry(
      {required BuildContext context,
      required Country country}) = _SelectCountry;
  const factory PrayerTimeEvent.selectCity(
      {required BuildContext context,
      required District district}) = _SelectCity;
  const factory PrayerTimeEvent.clearSelectedLocation() =
      _ClearSelectedLocation;
  const factory PrayerTimeEvent.clearSelectedCity() =
      _ClearSelectedCity;
  const factory PrayerTimeEvent.submitLocation(
      {required BuildContext context,
      required UserCoordinator userCoordinator}) = _SubmitLocation;
  const factory PrayerTimeEvent.isDistrictSelected(
      {required BuildContext context,
      required bool isDistrictSelected}) = _IsDistrictSelected;
  const factory PrayerTimeEvent.weatherDataLoaded(
      {required BuildContext context,
      required double latitude,
      required double longitude}) = _WeatherDataLoaded;
  const factory PrayerTimeEvent.isImsakTimeShow(
      {required BuildContext context,
      required bool isImsakEnable}) = _IsImsakTimeShow;
  const factory PrayerTimeEvent.imsakTimeDataLoaded() = _ImsakTimeDataLoaded;
  const factory PrayerTimeEvent.autoDetectLocationStatusChange({required BuildContext context,
    required bool isAutoDetectLocationEnable}) = _AutoDetectLocationStatusChange;
  const factory PrayerTimeEvent.selectPrayerConvention({
    required BuildContext context,
    required String prayerConventionName,
    required double fajrAngle,
    required double ishaAngle,
    required UserCoordinator userCoordinator,
  }) = _SelectPrayerConvention;

  const factory PrayerTimeEvent.selectAngle({
    required double fajrAngle,
    required double ishaAngle,
    required String prayerConventionName,
    required UserCoordinator userCoordinator,
    required BuildContext context,
  }) = _SelectAngle;
  const factory PrayerTimeEvent.selectCustomImsakTime({
    required int customImsakTime,
  }) = _SelectCustomImsakTime;
}
