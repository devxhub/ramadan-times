class ManualPrayerTime {
  final int manualFajrTime;
  final int manualSunriseTime;
  final int manualDhuhrTime;
  final int manualAsrTime;
  final int manualMaghribTime;
  final int manualIshaTime;

 const ManualPrayerTime({
    int? manualFajrTime,
    int? manualSunriseTime,
    int? manualDhuhrTime,
 int? manualAsrTime,
 int? manualMaghribTime,
    int? manualIshaTime,
  })  : manualFajrTime = manualFajrTime ?? 0,
        manualSunriseTime = manualSunriseTime ?? 0,
        manualDhuhrTime = manualDhuhrTime ?? 0,
        manualAsrTime = manualAsrTime??0,
        manualMaghribTime = manualMaghribTime??0,
        manualIshaTime = manualIshaTime ?? 0;
}