import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/src/models/timing/timing.dart' as timing;

import '../../l10n/app_localizations.dart';
import '../models/timing/timings.dart';

class NextPrayer extends StatelessWidget {
  const NextPrayer({
    super.key,
    required this.today,
    required this.nextDay,
  });
  final timing.Timing today;
  final timing.Timing nextDay;

  Map<String, dynamic> getNextPrayer(Timings today, Timings nextDay) {
    if (DateTime.now().isBefore(customHourMinuteOfToday(
      int.parse(
        today.fajr!.split(":").first,
      ),
      int.parse(
        today.fajr!.split(":").last,
      ),
    ))) {
      return {
        "start_minute": today.fajr?.split(":").last ?? "",
        "start_hour": today.fajr?.split(":").first ?? "",
        "end_minute": today.sunrise?.split(":").last ?? "",
        "end_hour": today.sunrise?.split(":").first ?? "",
        "name": "Fajr"
      };
    } else if (DateTime.now().isBefore(customHourMinuteOfToday(
      int.parse(
        today.dhuhr!.split(":").first,
      ),
      int.parse(
        today.dhuhr!.split(":").last,
      ),
    ))) {
      return {
        "start_minute": today.dhuhr?.split(":").last ?? "",
        "start_hour": today.dhuhr?.split(":").first ?? "",
        "end_minute": today.asr?.split(":").last ?? "",
        "end_hour": today.asr?.split(":").first ?? "",
        "name": "Dhuhr"
      };
    } else if (DateTime.now().isBefore(customHourMinuteOfToday(
      int.parse(
        today.asr!.split(":").first,
      ),
      int.parse(
        today.asr!.split(":").last,
      ),
    ))) {
      return {
        "start_minute": today.asr?.split(":").last ?? "",
        "start_hour": today.asr?.split(":").first ?? "",
        "end_minute": today.sunset?.split(":").last ?? "",
        "end_hour": today.sunset?.split(":").first ?? "",
        "name": "Asr"
      };
    } else if (DateTime.now().isBefore(customHourMinuteOfToday(
      int.parse(
        today.maghrib!.split(":").first,
      ),
      int.parse(
        today.maghrib!.split(":").last,
      ),
    ))) {
      return {
        "start_minute": today.maghrib?.split(":").last ?? "",
        "start_hour": today.maghrib?.split(":").first ?? "",
        "end_minute": today.isha?.split(":").last ?? "",
        "end_hour": today.isha?.split(":").first ?? "",
        "name": "Maghrib"
      };
    } else if (DateTime.now().isBefore(customHourMinuteOfToday(
      int.parse(
        today.isha!.split(":").first,
      ),
      int.parse(
        today.isha!.split(":").last,
      ),
    ))) {
      return {
        "start_minute": today.isha?.split(":").last ?? "",
        "start_hour": today.isha?.split(":").first ?? "",
        "end_minute": nextDay.fajr?.split(":").last ?? "",
        "end_hour": nextDay.fajr?.split(":").first ?? "",
        "name": "Isha"
      };
    } else {
      return {
        "start_minute": today.fajr?.split(":").last ?? "",
        "start_hour": today.fajr?.split(":").first ?? "",
        "end_minute": today.sunrise?.split(":").last ?? "",
        "end_hour": today.sunrise?.split(":").first ?? "",
        "name": "Fajr"
      };
    }
  }

  DateTime customHourMinuteOfToday(int hour, int minute) {
    return DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hour, minute);
  }

  @override
  Widget build(BuildContext context) {
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
                      getNextPrayer(today.data!.timings!,
                              nextDay.data!.timings!)['name'] ??
                          "",
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
                  text: DateFormat.jm("bn_BD").format(
                    DateTime(
                      2023,
                      1,
                      1,
                      int.tryParse(getNextPrayer(today.data!.timings!,
                              nextDay.data!.timings!)["start_hour"]) ??
                          0,
                      int.tryParse(getNextPrayer(today.data!.timings!,
                              nextDay.data!.timings!)["start_minute"]) ??
                          0,
                    ),
                  ),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: const Color(0xff674cec)),
                  children: [
                    // TextSpan(
                    //     text: "AM",
                    //     style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: " - ",
                        style: Theme.of(context).textTheme.titleLarge),
                    TextSpan(
                      text: DateFormat.jm("bn_BD").format(
                        DateTime(
                          2023,
                          1,
                          1,
                          int.tryParse(getNextPrayer(today.data!.timings!,
                                  nextDay.data!.timings!)["end_hour"]) ??
                              0,
                          int.tryParse(getNextPrayer(today.data!.timings!,
                                  nextDay.data!.timings!)["end_minute"]) ??
                              0,
                        ),
                      ),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
