import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/src/prayer_times/data/models/prayer_times.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../l10n/app_localizations.dart';
import '../bloc/home/bloc/calendar_bloc.dart';
import '../bloc/home/bloc/calendar_event.dart';
import '../component/eng_to_bn.dart';
import '../models/address/district.dart';
import '../models/timing/timings.dart';

class CurrentPrayer extends StatelessWidget {
  const CurrentPrayer({
    super.key,
    required this.today,
    required this.nextDay,
  });
  final PrayerTimesResponse today;
  final PrayerTimesResponse nextDay;

  Map<String, dynamic> getCurrentPrayer(Timings today, Timings nextDay) {
    DateTime now = DateTime.now();

    // Helper function to parse a DateTime object
    DateTime parseTime(String dateTimeString) {
      return DateTime.parse(dateTimeString);
    }

    // Parse all timings
    DateTime fajrTime = parseTime(today.fajr!);
    DateTime sunriseTime = parseTime(today.sunrise!);
    DateTime dhuhrTime = parseTime(today.dhuhr!);
    DateTime asrTime = parseTime(today.asr!);
    DateTime maghribTime = parseTime(today.maghrib!);
    DateTime ishaTime = parseTime(today.isha!);
    DateTime nextFajrTime = parseTime(nextDay.fajr!);

    // Helper function to create custom DateTime objects
    DateTime customHourMinuteOfToday(int hour, int minute) {
      return DateTime(now.year, now.month, now.day, hour, minute);
    }

    if (now.isAfter(customHourMinuteOfToday(0, 0)) && now.isBefore(fajrTime)) {
      return {
        "end_minute": fajrTime.minute.toString(),
        "end_hour": fajrTime.hour.toString(),
        "name": "Isha"
      };
    } else if (now.isAfter(fajrTime) && now.isBefore(sunriseTime)) {
      return {
        "end_minute": sunriseTime.minute.toString(),
        "end_hour": sunriseTime.hour.toString(),
        "name": "Fajr"
      };
    } else if (now.isAfter(sunriseTime) && now.isBefore(dhuhrTime)) {
      return {
        "end_minute": dhuhrTime.minute.toString(),
        "end_hour": dhuhrTime.hour.toString(),
        "name": "Ishrak"
      };
    } else if (now.isAfter(dhuhrTime) && now.isBefore(asrTime)) {
      return {
        "end_minute": asrTime.minute.toString(),
        "end_hour": asrTime.hour.toString(),
        "name": "Dhuhr"
      };
    } else if (now.isAfter(asrTime) && now.isBefore(maghribTime)) {
      return {
        "end_minute": maghribTime.minute.toString(),
        "end_hour": maghribTime.hour.toString(),
        "name": "Asr"
      };
    } else if (now.isAfter(maghribTime) && now.isBefore(ishaTime)) {
      return {
        "end_minute": ishaTime.minute.toString(),
        "end_hour": ishaTime.hour.toString(),
        "name": "Maghrib"
      };
    } else if (now.isAfter(ishaTime) &&
        now.isBefore(customHourMinuteOfToday(23, 59))) {
      return {
        "isToday": "true",
        "end_minute": nextFajrTime.minute.toString(),
        "end_hour": nextFajrTime.hour.toString(),
        "name": "Isha"
      };
    } else {
      return {
        "isToday": "true",
        "end_minute": fajrTime.minute.toString(),
        "end_hour": fajrTime.hour.toString(),
        "name": "Isha"
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    Timings timingsToday = Timings(
      asr: today.asrStart,
      dhuhr: today.dhuhrStart,
      fajr: today.fajrStart,
      isha: today.ishaStart,
      maghrib: today.maghribStart,
      midnight: today.noonEnd,
      sunrise: today.sunrise,
      sunset: today.sunset,
    );
    Timings timingsNextToday = Timings(
      asr: today.asrStart,
      dhuhr: today.dhuhrStart,
      fajr: today.fajrStart,
      isha: today.ishaStart,
      maghrib: today.maghribStart,
      midnight: today.noonEnd,
      sunrise: today.sunrise,
      sunset: today.sunset,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${AppLocalizations.of(context)?.prayerName(
            getCurrentPrayer(
                timingsToday, timingsNextToday)['name'] ??
                "",
          ) ?? ""} ${AppLocalizations.of(context)?.prayer}",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: const Color(0xff000000),
              fontSize: 18.sp,
              height: 1,
              fontWeight: FontWeight.w600),
        ),
        Text(
          "${AppLocalizations.of(context)?.timeRemaining ?? ""} ",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 16.sp,
              color: const Color(0xff6348EB),
              fontWeight: FontWeight.w600),
        ),
        CountdownTimer(
          endTime: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            (getCurrentPrayer(timingsToday, timingsNextToday)["name"] ==
                        "Isha" &&
                    !DateTime.now().isAfter(DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        23,
                        59,
                        59)))
                ? DateTime.now().day + 1
                : DateTime.now().day,
            int.parse(getCurrentPrayer(
                timingsToday, timingsNextToday)["end_hour"]),
            int.parse(getCurrentPrayer(
                timingsToday, timingsNextToday)["end_minute"]),
          ).millisecondsSinceEpoch,
          onEnd: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();

            context.read<HomeBloc>().add(
                  DataFetched(
                    date: DateFormat("dd-MM-yyyy").format(
                      DateTime.now(),
                    ),
                    city: District.fromJson(jsonDecode(
                            preferences.getString("current_location")!))
                        .bn_name,
                  ),
                );
          },
          widgetBuilder: (_, CurrentRemainingTime? time) {
            if (time == null) {
              return const Text("");
            }
            return Row(
              children: [
                Text(
                  AppLocalizations.of(context)?.localeName == "bn"
                      ? engToBn(
                          '${time.hours?.toString().padLeft(2, "0") ?? "00"} ঘ. : ${time.min?.toString().padLeft(2, "0") ?? "00"} মি. : ${time.sec.toString().padLeft(2, "0")} সে.', context)
                      : '${time.hours?.toString().padLeft(2, "0") ?? "00"} : ${time.min?.toString().padLeft(2, "0") ?? "00"} : ${time.sec.toString().padLeft(2, "0")}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xff6348EB),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
