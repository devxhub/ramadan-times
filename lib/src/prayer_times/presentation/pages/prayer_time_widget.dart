import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/l10n/app_localizations.dart';
import 'package:ramadantimes/src/prayer_times/presentation/bloc/prayer_time_bloc.dart';
import '../widgets/prayer_time_row.dart';

class PrayerTimeWidget extends StatelessWidget {
  const PrayerTimeWidget({super.key});
  String convertUtcToLocalTime(String utcDate, String? locale) {
    print("UTC data: $utcDate");
    final utcDateTime = DateTime.parse(utcDate);
    // Convert the UTC time to local time
    DateTime localDate = utcDateTime.toLocal();

    // Format the DateTime to display in the format "hh:mm a" with the specified locale
    String formattedTime = DateFormat('hh:mm a', locale).format(localDate);

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
      builder: (context, state) {
        return
            //  state.prayerTimeStatus == PrayerTimeStatus.initial ||
            //         state.prayerTimesResponse.fajrStart == null
            //     ? PrayerTimeLoader()
            //     :
            PhysicalModel(
          color: Color.fromARGB(255, 218, 218, 249),
          borderRadius: BorderRadius.circular(15.w),
          elevation: 2,
          shadowColor: Color.fromARGB(255, 218, 218, 249),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(15.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    AppLocalizations.of(context)!.prayerTimes,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Column(
                  children: [
                    state.isImsakEnable == true
                        ? PrayerTimeRow(
                            prayerName: AppLocalizations.of(context)!.imsak,
                            timeRange:
                                "${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.imsakStart.toString()).subtract(Duration(minutes: state.imsakTime)).toIso8601String()), AppLocalizations.of(context)?.localeName)} - ${convertUtcToLocalTime(state.prayerTimesResponse.imsakEnd.toString(), AppLocalizations.of(context)?.localeName)}",
                            isCurrentPrayer: false,
                            icon: Icons.nightlight_round_rounded,
                          )
                        : SizedBox(),
                    PrayerTimeRow(
                      prayerName: AppLocalizations.of(context)!.fajr,
                      timeRange:
                          "${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.fajrStart.toString()).add(Duration(minutes: state.manualPrayerTime.manualFajrTime ?? 0)).toIso8601String()), AppLocalizations.of(context)?.localeName)} - ${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.fajrEnd.toString()).add(Duration(minutes: state.manualPrayerTime.manualFajrTime ?? 0)).toIso8601String()), AppLocalizations.of(context)?.localeName)}",
                      isCurrentPrayer: false,
                      icon: Icons.sunny_snowing,
                    ),
                    PrayerTimeRow(
                      prayerName: AppLocalizations.of(context)!.dhuhr,
                      timeRange:
                          "${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.dhuhrStart.toString()).add(Duration(minutes: state.manualPrayerTime.manualDhuhrTime ?? 0)).toIso8601String()), AppLocalizations.of(context)?.localeName)} - ${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.dhuhrEnd.toString()).add(Duration(minutes: state.manualPrayerTime.manualDhuhrTime ?? 0)).toIso8601String()), AppLocalizations.of(context)?.localeName)}",
                      isCurrentPrayer: false,
                      icon: Icons.sunny,
                    ),
                    PrayerTimeRow(
                      prayerName: AppLocalizations.of(context)!.asr,
                      timeRange:
                          "${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.asrStart.toString()).add(Duration(minutes: state.manualPrayerTime.manualAsrTime ?? 0)).toIso8601String()), AppLocalizations.of(context)?.localeName)} - ${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.asrEnd.toString()).add(Duration(minutes: state.manualPrayerTime.manualAsrTime ?? 0)).toIso8601String()), AppLocalizations.of(context)?.localeName)}",
                      isCurrentPrayer: false,
                      icon: Icons.sunny,
                    ),
                    PrayerTimeRow(
                      prayerName: AppLocalizations.of(context)!.maghrib,
                      timeRange:
                          "${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.maghribStart.toString()).add(Duration(minutes: state.manualPrayerTime.manualMaghribTime ?? 0)).toIso8601String()), AppLocalizations.of(context)?.localeName)} - ${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.maghribEnd.toString()).add(Duration(minutes: state.manualPrayerTime.manualMaghribTime ?? 0)).toIso8601String()), AppLocalizations.of(context)?.localeName)}",
                      isCurrentPrayer: false,
                      icon: Icons.sunny_snowing,
                    ),
                    PrayerTimeRow(
                      prayerName: AppLocalizations.of(context)!.isha,
                      timeRange:
                          "${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.ishaStart.toString()).add(Duration(minutes: state.manualPrayerTime.manualIshaTime ?? 0)).toIso8601String()), AppLocalizations.of(context)?.localeName)} - ${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.ishaEnd.toString()).add(Duration(minutes: state.manualPrayerTime.manualIshaTime ?? 0)).toIso8601String()), AppLocalizations.of(context)?.localeName)}",
                      isCurrentPrayer: false,
                      icon: Icons.nightlight_round_rounded,
                    ),
                    PrayerTimeRow(
                      prayerName: AppLocalizations.of(context)!.awabin,
                      timeRange:
                          "${convertUtcToLocalTime(state.prayerTimesResponse.awwabinStart.toString(), AppLocalizations.of(context)?.localeName)} - ${convertUtcToLocalTime(state.prayerTimesResponse.awwabinEnd.toString(), AppLocalizations.of(context)?.localeName)}",
                      isCurrentPrayer: false,
                      icon: Icons.nightlight_round_rounded,
                    ),
                    PrayerTimeRow(
                      prayerName: AppLocalizations.of(context)!.tahajjud,
                      timeRange:
                          "${AppLocalizations.of(context)!.afterIsha} - ${convertUtcToLocalTime(state.prayerTimesResponse.tahajjudEnd.toString(), AppLocalizations.of(context)?.localeName)}",
                      isCurrentPrayer: false,
                      icon: Icons.nightlight_round_rounded,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Divider(
                    color: Colors.grey[500],
                    thickness: 1,
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    AppLocalizations.of(context)!.prohibitedPrayerTimes,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Column(
                  children: [
                    PrayerTimeRow(
                      icon: Icons.sunny_snowing,
                      isCurrentPrayer: false,
                      prayerName: AppLocalizations.of(context)!.morning,
                      timeRange:
                          "${convertUtcToLocalTime(state.prayerTimesResponse.dawnStart.toString(), AppLocalizations.of(context)?.localeName)} - ${convertUtcToLocalTime(state.prayerTimesResponse.dawnEnd.toString(), AppLocalizations.of(context)?.localeName)}",
                    ),
                    PrayerTimeRow(
                      icon: Icons.wb_sunny_sharp,
                      prayerName: AppLocalizations.of(context)!.noon,
                      timeRange:
                          "${convertUtcToLocalTime(state.prayerTimesResponse.noonStart.toString(), AppLocalizations.of(context)?.localeName)} - ${convertUtcToLocalTime(state.prayerTimesResponse.noonEnd.toString(), AppLocalizations.of(context)?.localeName)}",
                      isCurrentPrayer: false,
                    ),
                    PrayerTimeRow(
                      icon: Icons.wb_sunny_outlined,
                      prayerName: AppLocalizations.of(context)!.evening,
                      timeRange:
                          "${convertUtcToLocalTime(state.prayerTimesResponse.eveningStart.toString(), AppLocalizations.of(context)?.localeName)} - ${convertUtcToLocalTime(state.prayerTimesResponse.eveningEnd.toString(), AppLocalizations.of(context)?.localeName)}",
                      isCurrentPrayer: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
