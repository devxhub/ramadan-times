import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ramadantimes/src/models/timing/timing.dart' as timing;

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
  final timing.Timing today;
  final timing.Timing nextDay;

  Map<String, dynamic> getCurrentPrayer(Timings today, Timings nextDay) {
    DateTime now = DateTime.now();
    if (DateTime.now().isAfter(customHourMinuteOfToday(
          00,
          00,
        )) &&
        DateTime.now().isBefore(customHourMinuteOfToday(
          int.parse(
            today.fajr!.split(":").first,
          ),
          int.parse(
            today.fajr!.split(":").last,
          ),
        ))) {
      return {
        "end_minute": today.fajr?.split(":").last ?? "",
        "end_hour": today.fajr?.split(":").first ?? "",
        "name": "Isha"
      };
    } else if (DateTime.now().isAfter(customHourMinuteOfToday(
          int.parse(
            today.fajr!.split(":").first,
          ),
          int.parse(
            today.fajr!.split(":").last,
          ),
        )) &&
        DateTime.now().isBefore(customHourMinuteOfToday(
          int.parse(
            today.sunrise!.split(":").first,
          ),
          int.parse(
            today.sunrise!.split(":").last,
          ),
        ))) {
      return {
        "end_minute": today.sunrise?.split(":").last ?? "",
        "end_hour": today.sunrise?.split(":").first ?? "",
        "name": "Fajr"
      };
    } else if (DateTime.now().isAfter(customHourMinuteOfToday(
          int.parse(
            today.sunrise!.split(":").first,
          ),
          int.parse(
            today.sunrise!.split(":").last,
          ),
        )) &&
        DateTime.now().isBefore(customHourMinuteOfToday(
          int.parse(
            today.dhuhr!.split(":").first,
          ),
          int.parse(
            today.dhuhr!.split(":").last,
          ),
        ))) {
      return {
        "end_minute": today.dhuhr?.split(":").last ?? "",
        "end_hour": today.dhuhr?.split(":").first ?? "",
        "name": "Ishrak"
      };
    } else if (DateTime.now().isAfter(customHourMinuteOfToday(
          int.parse(
            today.dhuhr!.split(":").first,
          ),
          int.parse(
            today.dhuhr!.split(":").last,
          ),
        )) &&
        DateTime.now().isBefore(customHourMinuteOfToday(
          int.parse(
            today.asr!.split(":").first,
          ),
          int.parse(
            today.asr!.split(":").last,
          ),
        ))) {
      return {
        "end_minute": today.asr?.split(":").last ?? "",
        "end_hour": today.asr?.split(":").first ?? "",
        "name": "Dhuhr"
      };
    } else if (DateTime.now().isAfter(customHourMinuteOfToday(
          int.parse(
            today.asr!.split(":").first,
          ),
          int.parse(
            today.asr!.split(":").last,
          ),
        )) &&
        DateTime.now().isBefore(customHourMinuteOfToday(
          int.parse(
            today.maghrib!.split(":").first,
          ),
          int.parse(
            today.maghrib!.split(":").last,
          ),
        ))) {
      return {
        "end_minute": today.maghrib?.split(":").last ?? "",
        "end_hour": today.maghrib?.split(":").first ?? "",
        "name": "Asr"
      };
    } else if (DateTime.now().isAfter(customHourMinuteOfToday(
          int.parse(
            today.maghrib!.split(":").first,
          ),
          int.parse(
            today.maghrib!.split(":").last,
          ),
        )) &&
        DateTime.now().isBefore(customHourMinuteOfToday(
          int.parse(
            today.isha!.split(":").first,
          ),
          int.parse(
            today.isha!.split(":").last,
          ),
        ))) {
      return {
        "end_minute": today.isha?.split(":").last ?? "",
        "end_hour": today.isha?.split(":").first ?? "",
        "name": "Maghrib"
      };
    } else if (now.isAfter(customHourMinuteOfToday(
          int.parse(
            today.isha!.split(":").first,
          ),
          int.parse(
            today.isha!.split(":").last,
          ),
        )) &&
        now.isBefore(customHourMinuteOfToday(23, 59))) {
      return {
        "isToday": "true",
        "end_minute": nextDay.fajr?.split(":").last ?? "",
        "end_hour": nextDay.fajr?.split(":").first ?? "",
        "name": "Isha"
      };
    } else {
      return {
        "isToday": "true",
        "end_minute": today.fajr?.split(":").last ?? "",
        "end_hour": today.fajr?.split(":").first ?? "",
        "name": "Isha"
      };
    }
  }

  DateTime customHourMinuteOfToday(int hour, int minute) {
    return DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hour, minute);
  }

  DateTime customHourMinuteOfNextDay(int hour, int minute) {
    return DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 1, hour, minute);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AutoSizeText(
                  "${AppLocalizations.of(context)?.prayerName(
                        getCurrentPrayer(today.data!.timings!,
                                nextDay.data!.timings!)['name'] ??
                            "",
                      ) ?? ""} ${AppLocalizations.of(context)?.prayer}",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xff000000),
                      fontSize: 18.sp,
                      height: 1,
                      fontWeight: FontWeight.w600),
                ),
                AutoSizeText(
                  " ${AppLocalizations.of(context)?.timeRemaining ?? ""} ",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xff6348EB),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            CountdownTimer(
              endTime: DateTime(
                DateTime.now().year,
                DateTime.now().month,
                (getCurrentPrayer(today.data!.timings!, nextDay.data!.timings!)[
                                "name"] ==
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
                    today.data!.timings!, nextDay.data!.timings!)["end_hour"]),
                int.parse(getCurrentPrayer(today.data!.timings!,
                    nextDay.data!.timings!)["end_minute"]),
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
                              .bn_name),
                    );
              },
              widgetBuilder: (_, CurrentRemainingTime? time) {
                if (time == null) {
                  return const Text("");
                }
                return Row(
                  children: [
                    AutoSizeText(
                      AppLocalizations.of(context)?.localeName == "bn"
                          ? engToBn(
                              '${time.hours?.toString().padLeft(2, "0") ?? "00"} ঘ. : ${time.min?.toString().padLeft(2, "0") ?? "00"} মি. : ${time.sec.toString().padLeft(2, "0")} সে.')
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
        ),
      ],
    );
  }
}
