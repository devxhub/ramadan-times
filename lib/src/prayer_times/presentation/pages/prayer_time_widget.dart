import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/src/prayer_times/presentation/bloc/prayer_time_bloc.dart';
import '../widgets/prayer_time_row.dart';

class PrayerTimeWidget extends StatelessWidget {
  const PrayerTimeWidget({super.key});
  String convertUtcToLocalTime(String utcDate) {
    print("Uts data $utcDate");
    final utcDateTime = DateTime.parse(utcDate.toString());
    // Convert the UTC time to local time
    DateTime localDate = utcDateTime.toLocal();

    // Format the DateTime to display in the format "hh:mm a"
    String formattedTime = DateFormat('hh:mm a').format(localDate);

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
                    "Prayer Times",
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
                    state.isImsakEnable==true?
                    PrayerTimeRow(
                      prayerName: "Imsak",
                      timeRange:
                          "${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.imsakStart.toString()).subtract(Duration(minutes: state.imsakTime)).toIso8601String()))} - ${convertUtcToLocalTime(state.prayerTimesResponse.imsakEnd.toString())}",
                      isCurrentPrayer: false,
                    ):SizedBox(),
                    PrayerTimeRow(
                      prayerName: "Fajr",
                      timeRange:
                      "${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.fajrStart.toString()).add(Duration(minutes: state.manualPrayerTime.manualFajrTime??0)).toIso8601String()))} - ${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.fajrEnd.toString()).add(Duration(minutes: state.manualPrayerTime.manualFajrTime??0)).toIso8601String()))}",
                      isCurrentPrayer: false,
                    ),
                    // PrayerTimeRow(
                    //   prayerName: "Salatud Duha",
                    //   timeRange: "${convertUtcToLocalTime(state.prayerTimesResponse..toString())} - ${convertUtcToLocalTime(state.prayerTimesResponse.fajrEnd.toString())}",
                    //   isCurrentPrayer: false,
                    // ),
                    PrayerTimeRow(
                      prayerName: "Dhuhr",
                      timeRange:
                      "${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.dhuhrStart.toString()).add(Duration(minutes: state.manualPrayerTime.manualDhuhrTime??0)).toIso8601String()))} - ${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.dhuhrEnd.toString()).add(Duration(minutes: state.manualPrayerTime.manualDhuhrTime??0)).toIso8601String()))}",
                      isCurrentPrayer: false,
                    ),
                    PrayerTimeRow(
                      prayerName: "Asr",
                      timeRange:
                      "${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.asrStart.toString()).add(Duration(minutes: state.manualPrayerTime.manualAsrTime??0)).toIso8601String()))} - ${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.asrEnd.toString()).add(Duration(minutes: state.manualPrayerTime.manualAsrTime??0)).toIso8601String()))}",
                      isCurrentPrayer: false,
                    ),
                    PrayerTimeRow(
                      prayerName: "Maghrib",

                      timeRange:
                      "${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.maghribStart.toString()).add(Duration(minutes: state.manualPrayerTime.manualMaghribTime??0)).toIso8601String()))} - ${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.maghribEnd.toString()).add(Duration(minutes: state.manualPrayerTime.manualMaghribTime??0)).toIso8601String()))}",
                      isCurrentPrayer: false,
                    ),
                    PrayerTimeRow(
                      prayerName: "Isha",
                      timeRange:
                      "${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.ishaStart.toString()).add(Duration(minutes: state.manualPrayerTime.manualIshaTime??0)).toIso8601String()))} - ${convertUtcToLocalTime((DateTime.parse(state.prayerTimesResponse.ishaEnd.toString()).add(Duration(minutes: state.manualPrayerTime.manualIshaTime??0)).toIso8601String()))}",
                      isCurrentPrayer: false,
                    ),
                    PrayerTimeRow(
                      prayerName: "Awabin",
                      timeRange:
                          "${convertUtcToLocalTime(state.prayerTimesResponse.awwabinStart.toString())} - ${convertUtcToLocalTime(state.prayerTimesResponse.awwabinEnd.toString())}",
                      isCurrentPrayer: false,
                    ),
                    PrayerTimeRow(
                      prayerName: "Tahajjud",
                      timeRange:
                          "After Isha - ${convertUtcToLocalTime(state.prayerTimesResponse.tahajjudEnd.toString())}",
                      isCurrentPrayer: false,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    "Prohibited Times",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Column(
                  children: [
                    PrayerTimeRow(
                      isCurrentPrayer: false,
                      prayerName: "Morning",
                      timeRange:
                          "${convertUtcToLocalTime(state.prayerTimesResponse.dawnStart.toString())} - ${convertUtcToLocalTime(state.prayerTimesResponse.dawnEnd.toString())}",
                    ),
                    PrayerTimeRow(
                      prayerName: "Noon",
                      timeRange:
                          "${convertUtcToLocalTime(state.prayerTimesResponse.noonStart.toString())} - ${convertUtcToLocalTime(state.prayerTimesResponse.noonEnd.toString())}",
                      isCurrentPrayer: false,
                    ),
                    PrayerTimeRow(
                      prayerName: "Evening",
                      timeRange:
                          "${convertUtcToLocalTime(state.prayerTimesResponse.eveningStart.toString())} - ${convertUtcToLocalTime(state.prayerTimesResponse.eveningEnd.toString())}",
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
