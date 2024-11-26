import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/src/prayer_times/data/models/prayer_times.dart';
import '../../l10n/app_localizations.dart';
import '../prayer_times/data/models/prayer_time_format_model.dart';

class NextPrayer extends StatelessWidget {
  const NextPrayer({
    super.key,
    required this.today,
    required this.nextDay,
  });
  final PrayerTimesResponse today;
  final PrayerTimesResponse nextDay;

  String formatTime(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }

  PrayerTime? getNextPrayerTime(
      Map<String, String> today, Map<String, String> nextDay) {
    DateTime now = DateTime.now();

    DateTime convertToDate(String timeString) {
      return DateTime.parse(timeString.replaceFirst(' ', 'T'));
    }

    String formatTime(DateTime date) {
      return DateFormat('hh:mm a').format(date);
    }

    List<PrayerTime> prayerTimes = [
      PrayerTime(
          name: "Fajr",
          start: formatTime(convertToDate(today['fajrStart']!)),
          end: formatTime(convertToDate(today['fajrEnd']!))),
      PrayerTime(
          name: "Dhuhr",
          start: formatTime(convertToDate(today['dhuhrStart']!)),
          end: formatTime(convertToDate(today['dhuhrEnd']!))),
      PrayerTime(
          name: "Asr",
          start: formatTime(convertToDate(today['asrStart']!)),
          end: formatTime(convertToDate(today['asrEnd']!))),
      PrayerTime(
          name: "Maghrib",
          start: formatTime(convertToDate(today['maghribStart']!)),
          end: formatTime(convertToDate(today['maghribEnd']!))),
      PrayerTime(
          name: "Isha",
          start: formatTime(convertToDate(today['ishaStart']!)),
          end: formatTime(convertToDate(today['ishaEnd']!))),
      PrayerTime(
          name: "Fajr (Next Day)",
          start: formatTime(convertToDate(nextDay['fajrStart']!)),
          end: formatTime(convertToDate(nextDay['fajrEnd']!))),
    ];

    var nextPrayer = prayerTimes.firstWhere(
      (prayer) => now.isBefore(convertToDate(
          today['${prayer.name.toLowerCase().split(' ')[0]}Start']!)),
    );

    return nextPrayer;
  }

  DateTime customHourMinuteOfToday(int hour, int minute) {
    return DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hour, minute);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> todayModel = {
      'fajrStart': today.fajrStart!,
      'fajrEnd': today.fajrEnd!,
      'dhuhrStart': today.dhuhrEnd!,
      'dhuhrEnd': today.dhuhrEnd!,
      'asrStart': today.asrStart!,
      'asrEnd': today.asrEnd!,
      'maghribStart': today.maghribStart!,
      'maghribEnd': today.maghribEnd!,
      'ishaStart': today.ishaStart!,
      'ishaEnd': today.ishaEnd!,
    };

    Map<String, String> nextDayModel = {
      'fajrStart': nextDay.fajrStart!,
      'fajrEnd': nextDay.fajrEnd!,
    };
    print(todayModel);
    return Container(
      margin: const EdgeInsets.only(top: 24, left: 1, right: 1),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color(0xffD9DFE0),
            const Color(0xffD9DFE0).withOpacity(0),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          color: Colors.white,
          borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                AppLocalizations.of(context)?.nextPrayer ?? "",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              AutoSizeText(
                AppLocalizations.of(context)?.prayerName(
                      getNextPrayerTime(todayModel, nextDayModel)!.name,
                    ) ??
                    "",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: const Color(0xff674cec), height: 1, fontSize: 20.sp),
              )
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: const Color(0xfff2f2f7),
                borderRadius: BorderRadius.circular(15.r)),
            child: AutoSizeText.rich(
              TextSpan(
                  text: getNextPrayerTime(todayModel, nextDayModel)!
                      .start
                      .toString(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: const Color(0xff674cec)),
                  children: [
                    TextSpan(
                        text: " - ",
                        style: Theme.of(context).textTheme.titleLarge),
                    TextSpan(
                      text: getNextPrayerTime(todayModel, nextDayModel)!
                          .end
                          .toString(),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
