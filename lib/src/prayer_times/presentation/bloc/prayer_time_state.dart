part of 'prayer_time_bloc.dart';

enum PrayerTimeStatus {
  initial,
  success,
  failure,
  inProgress,
  inProgressFilter
}

@Freezed()
class PrayerTimeState with _$PrayerTimeState {
  const factory PrayerTimeState({
    @Default(PrayerTimesResponse()) PrayerTimesResponse prayerTimesResponse,
    @Default(PrayerTimeStatus.success) PrayerTimeStatus prayerTimeStatus,
  }) = _PrayerTimeState;
}
