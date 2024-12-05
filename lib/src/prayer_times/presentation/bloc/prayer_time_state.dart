part of 'prayer_time_bloc.dart';

enum PrayerTimeStatus {
  initial,
  success,
  failure,
  inProgress,
  inProgressFilter
}

enum PrayerStatus { initial, success, failure, inProgress, inProgressFilter }

@Freezed()
class PrayerTimeState with _$PrayerTimeState {
  const factory PrayerTimeState({
    @Default(PrayerTimesResponse()) PrayerTimesResponse prayerTimesResponse,
    @Default(PrayerTimesResponse())
    PrayerTimesResponse prayerTimesResponseNextDay,
    @Default(CountryResponse()) CountryResponse countryResponse,
    @Default(UserCoordinator()) UserCoordinator userCoordinator,
    @Default(WeatherModel()) WeatherModel weatherResponse,
    Country? selectedCountry,
    District? selectedDistrict,
    @Default(true) bool isDistrictSelected,
    @Default(PrayerTimeStatus.success) PrayerTimeStatus prayerTimeStatus,
    @Default(PrayerStatus.success) PrayerStatus prayerStatus,
    @Default('') String selectedPrayerConventionName,
    @Default(0.0) double selectedFajrAngle,
    @Default(0.0) double selectedIshaAngle,
  }) = _PrayerTimeState;
}
