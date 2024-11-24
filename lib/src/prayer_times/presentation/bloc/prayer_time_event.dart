part of 'prayer_time_bloc.dart';

@freezed
class PrayerTimeEvent with _$PrayerTimeEvent {
  const factory PrayerTimeEvent.prayerTimesDataLoaded({required double latitude,required double longitude}) =
  _PrayerTimesDataLoaded;
}
