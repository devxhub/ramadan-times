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

  String formatTime(DateTime date, BuildContext context) {
    return DateFormat('hh:mm a', AppLocalizations.of(context)?.localeName)
        .format(date);
  }

  PrayerTime? getNextPrayerTime(
      Map<String, String> today, Map<String, String> nextDay) {
    DateTime now = DateTime.now();

    // Convert time string to DateTime
    DateTime convertToDateTime(String timeString) {
      var date = DateTime.parse(timeString.replaceFirst(' ', 'T'));
      return date;
    }

    // Helper function to check if a prayer time is upcoming
    bool isUpcomingPrayer(DateTime prayerTimeStart) {
      return now.isBefore(prayerTimeStart);
    }

    // Define the prayer times for today and next day
    List<PrayerTime> prayerTimes = [
      PrayerTime(
          name: "Fajr",
          start: convertToDateTime(today['fajrStart']!),
          end: convertToDateTime(today['fajrEnd']!)),
      PrayerTime(
          name: "Dhuhr",
          start: convertToDateTime(today['dhuhrStart']!),
          end: convertToDateTime(today['dhuhrEnd']!)),
      PrayerTime(
          name: "Asr",
          start: convertToDateTime(today['asrStart']!),
          end: convertToDateTime(today['asrEnd']!)),
      PrayerTime(
          name: "Maghrib",
          start: convertToDateTime(today['maghribStart']!),
          end: convertToDateTime(today['maghribEnd']!)),
      PrayerTime(
          name: "Isha",
          start: convertToDateTime(today['ishaStart']!),
          end: convertToDateTime(today['ishaEnd']!)),
      PrayerTime(
          name: "FajrNext",
          start: convertToDateTime(nextDay['fajrStart']!),
          end: convertToDateTime(nextDay['fajrEnd']!)),
    ];

    // Find the next prayer time
    PrayerTime? nextPrayer = prayerTimes.firstWhere(
          (prayer) => isUpcomingPrayer(prayer.start),
      orElse: () {
        // If no prayer is found for today, return the first prayer of the next day
        return prayerTimes.last;
      },
    );

    print('Next prayer is: ${nextPrayer.name} at ${nextPrayer.start}');
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
          var nextPrayer = getNextPrayerTime(todayModel, nextDayModel);
          return Container(
            margin: EdgeInsets.only(top: 24.h, left: 1.w, right: 1.w),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color(0xffD9DFE0),
                  const Color(0xffD9DFE0).withOpacity(0),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r)),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)?.nextPrayer ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      AppLocalizations.of(context)?.prayerName(
                        nextPrayer!.name,
                      ) ??
                          "",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: const Color(0xff674cec),
                          height: 1,
                          fontSize: 18.sp),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                      color: const Color(0xfff2f2f7),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Row(
                    children: [
                      Text(
                        formatTime(nextPrayer!.start, context),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: const Color(0xff674cec),
                        ),
                      ),
                      Text(
                        " - ",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: const Color(0xff674cec),
                        ),
                      ),
                      Text(
                        formatTime(nextPrayer.end, context),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: const Color(0xff674cec),
                        ),
                      ),
                    ],
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