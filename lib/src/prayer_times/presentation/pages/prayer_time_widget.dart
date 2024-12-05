import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/l10n/app_localizations.dart';
import 'package:ramadantimes/src/prayer_times/presentation/bloc/prayer_time_bloc.dart';

import '../../../component/eng_to_bn.dart';

class PrayerTimeWidget extends StatelessWidget {
  const PrayerTimeWidget({super.key});
  String convertUtcToLocalTime(String utcDate, BuildContext context) {
    final utcDateTime = DateTime.parse(utcDate.toString());
    // Convert the UTC time to local time
    DateTime localDate = utcDateTime.toLocal();

    // Format the DateTime to display in the format "hh:mm a"
    String formattedTime = DateFormat('hh:mm a', AppLocalizations.of(context)?.localeName).format(localDate);

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
      builder: (context, state) {
        return state.prayerTimeStatus == PrayerTimeStatus.initial ||
                state.prayerTimesResponse.fajrStart == null
            ? SizedBox(
                height: 20.h,
                width: 20.w,
                child: Center(child: CircularProgressIndicator.adaptive()))
            : PhysicalModel(
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
                          PrayerTimeRow(
                            prayerName: AppLocalizations.of(context)!.fajr,
                            timeRange:
                                "${convertUtcToLocalTime(state.prayerTimesResponse.fajrStart.toString(), context)} - ${convertUtcToLocalTime(state.prayerTimesResponse.fajrEnd.toString(), context)}",
                            isCurrentPrayer: false,
                          ),
                          // PrayerTimeRow(
                          //   prayerName: "Salatud Duha",
                          //   timeRange: "${convertUtcToLocalTime(state.prayerTimesResponse..toString())} - ${convertUtcToLocalTime(state.prayerTimesResponse.fajrEnd.toString())}",
                          //   isCurrentPrayer: false,
                          // ),
                          PrayerTimeRow(
                            prayerName: AppLocalizations.of(context)!.dhuhr,
                            timeRange:
                                "${convertUtcToLocalTime(state.prayerTimesResponse.dhuhrStart.toString(), context)} - ${convertUtcToLocalTime(state.prayerTimesResponse.dhuhrEnd.toString(), context)}",
                            isCurrentPrayer: false,
                          ),
                          PrayerTimeRow(
                            prayerName: AppLocalizations.of(context)!.asr,
                            timeRange:
                                "${convertUtcToLocalTime(state.prayerTimesResponse.asrStart.toString(), context)} - ${convertUtcToLocalTime(state.prayerTimesResponse.asrEnd.toString(), context)}",
                            isCurrentPrayer: false,
                          ),
                          PrayerTimeRow(
                            prayerName: AppLocalizations.of(context)!.maghrib,
                            timeRange:
                                "${convertUtcToLocalTime(state.prayerTimesResponse.maghribStart.toString(), context)} - ${convertUtcToLocalTime(state.prayerTimesResponse.maghribEnd.toString(), context)}",
                            isCurrentPrayer: false,
                          ),
                          PrayerTimeRow(
                            prayerName: AppLocalizations.of(context)!.isha,
                            timeRange:
                                "${convertUtcToLocalTime(state.prayerTimesResponse.ishaStart.toString(), context)} - ${convertUtcToLocalTime(state.prayerTimesResponse.ishaEnd.toString(), context)}",
                            isCurrentPrayer: false,
                          ),
                          PrayerTimeRow(
                            prayerName: AppLocalizations.of(context)!.awabin,
                            timeRange:
                                "${convertUtcToLocalTime(state.prayerTimesResponse.awwabinStart.toString(), context)} - ${convertUtcToLocalTime(state.prayerTimesResponse.awwabinEnd.toString(), context)}",
                            isCurrentPrayer: false,
                          ),
                          PrayerTimeRow(
                            prayerName: AppLocalizations.of(context)!.tahajjud,
                            timeRange:
                                "${AppLocalizations.of(context)!.afterIsha} - ${  engToBn(convertUtcToLocalTime(state.prayerTimesResponse.tahajjudEnd.toString(), context), context)}",
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
                          AppLocalizations.of(context)!.prohibitedPrayerTimes,
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
                            prayerName: AppLocalizations.of(context)!.morning,
                            timeRange:
                                "${convertUtcToLocalTime(state.prayerTimesResponse.dawnStart.toString(), context)} - ${convertUtcToLocalTime(state.prayerTimesResponse.dawnEnd.toString(), context)}",
                          ),
                          PrayerTimeRow(
                            prayerName: AppLocalizations.of(context)!.noon,
                            timeRange:
                                "${convertUtcToLocalTime(state.prayerTimesResponse.noonStart.toString(), context)} - ${convertUtcToLocalTime(state.prayerTimesResponse.noonEnd.toString(), context)}",
                            isCurrentPrayer: false,
                          ),
                          PrayerTimeRow(
                            prayerName: AppLocalizations.of(context)!.evening,
                            timeRange:
                                "${convertUtcToLocalTime(state.prayerTimesResponse.eveningStart.toString(), context)} - ${convertUtcToLocalTime(state.prayerTimesResponse.eveningEnd.toString(), context)}",
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

class PrayerTimeRow extends StatelessWidget {
  final String prayerName;
  final String timeRange;
  final bool isCurrentPrayer;

  const PrayerTimeRow({
    super.key,
    required this.prayerName,
    required this.timeRange,
    required this.isCurrentPrayer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      color: isCurrentPrayer ? Color(0xFFE6E6FA) : Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 12.r,
                  backgroundColor: Color.fromARGB(255, 220, 220, 245),
                  child: Icon(
                    Icons.access_time,
                    color: isCurrentPrayer ? Colors.red : Colors.deepPurple,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  prayerName,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: isCurrentPrayer ? Colors.red : Colors.deepPurple,
                  ),
                ),
              ],
            ),
            Text(
              timeRange,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: isCurrentPrayer ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
