part of 'prayer_time_bloc.dart';

@freezed
class PrayerTimeEvent with _$PrayerTimeEvent {
  const factory PrayerTimeEvent.prayerTimesDataLoaded({required double latitude,required double longitude}) =
  _PrayerTimesDataLoaded;
  const factory PrayerTimeEvent.countryDataLoaded() =
  _CountryDataLoaded;
  const factory PrayerTimeEvent.locationPermission({required BuildContext context}) =
  _LocationPermission;
  const factory PrayerTimeEvent.selectCountry({required BuildContext context,required Country country}) =
  _SelectCountry;
  const factory PrayerTimeEvent.selectCity({required BuildContext context,required District district}) =
  _SelectCity;
  const factory PrayerTimeEvent.submitLocation({required BuildContext context,required UserCoordinator userCoordinator}) =
  _SubmitLocation;
  const factory PrayerTimeEvent.isDistrictSelected({required BuildContext context,required bool isDistrictSelected}) =
  _IsDistrictSelected;
}
