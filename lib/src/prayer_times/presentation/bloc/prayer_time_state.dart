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
    @Default(PrayerTimeStatus.success) PrayerTimeStatus prayerTimeStatus,
    @Default(CountryResponse()) CountryResponse countryResponse,
    @Default(UserCoordinator()) UserCoordinator userCoordinator,
    @Default(WeatherModel()) WeatherModel weatherResponse,
    Country? selectedCountry,
    District? selectedDistrict,
    @Default(true) bool isDistrictSelected,
    @Default(PrayerStatus.success) PrayerStatus prayerStatus,
  }) = _PrayerTimeState;
}
