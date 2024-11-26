import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../l10n/app_localizations.dart';
import '../prayer_times/data/models/prayer_time_format_model.dart';
import '../prayer_times/presentation/bloc/prayer_time_bloc.dart';

class NextPrayer extends StatelessWidget {
  const NextPrayer({
    super.key,
  });

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
      (prayer) {
        return now.isBefore(
          convertToDate(
              today['${prayer.name.toLowerCase().split(' ')[0]}Start']!),
        );
      },
      orElse: () {
        // Return a default or next day's Fajr if no prayer is found today
        return prayerTimes.last;
      },
    );

    return nextPrayer;
  }

  DateTime customHourMinuteOfToday(int hour, int minute) {
    return DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hour, minute);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
      builder: (context, state) {
        if (state.prayerStatus == PrayerStatus.initial ||
            state.prayerTimesResponse.fajrStart == null) {
          return CircularProgressIndicator.adaptive();
        }
        if (state.prayerStatus == PrayerStatus.success) {
          Map<String, String> todayModel = {
            'fajrStart': state.prayerTimesResponse.fajrStart!,
            'fajrEnd': state.prayerTimesResponse.fajrEnd!,
            'dhuhrStart': state.prayerTimesResponse.dhuhrStart!,
            'dhuhrEnd': state.prayerTimesResponse.dhuhrEnd!,
            'asrStart': state.prayerTimesResponse.asrStart!,
            'asrEnd': state.prayerTimesResponse.asrEnd!,
            'maghribStart': state.prayerTimesResponse.maghribStart!,
            'maghribEnd': state.prayerTimesResponse.maghribEnd!,
            'ishaStart': state.prayerTimesResponse.ishaStart!,
            'ishaEnd': state.prayerTimesResponse.ishaEnd!,
          };

          Map<String, String> nextDayModel = {
            'fajrStart': state.prayerTimesResponseNextDay.fajrStart!,
            'fajrEnd': state.prayerTimesResponseNextDay.fajrEnd!,
          };
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
                          color: const Color(0xff674cec),
                          height: 1,
                          fontSize: 20.sp),
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
        } else {
          return CircularProgressIndicator.adaptive();
        }
      },
    );
  }
}
