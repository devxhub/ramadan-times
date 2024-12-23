import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/src/prayer_times/presentation/bloc/prayer_time_bloc.dart';
import '../../l10n/app_localizations.dart';
import '../component/eng_to_bn.dart';
import '../prayer_times/data/models/prayer_times.dart';
import 'current_prayer.dart';

class TodayInfoCard extends StatefulWidget {
  final PrayerTimesResponse timeOfToday;
  final PrayerTimesResponse timeOfNextDay;
  const TodayInfoCard({
    super.key,
    required this.timeOfToday,
    required this.timeOfNextDay,
  });

  @override
  State<TodayInfoCard> createState() => _TodayInfoCardState();
}

class _TodayInfoCardState extends State<TodayInfoCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var hijriDate =
        HijriCalendar.fromDate(widget.timeOfToday.date ?? DateTime.now());

    return Container(
      // height: 200,
      // width: 375.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          const Color(0xffC2CFF2),
          const Color(0xffF8E99B).withOpacity(0)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        color: const Color(0xffe3deff),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Text("00\u2103"),
                    BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
                      builder: (context, state) {
                        return state.weatherResponse.main?.temp != null
                            ? Text(
                                engToBn(
                                    "${state.weatherResponse.main?.temp?.toStringAsFixed(0)}°",
                                    context),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff36219E)),
                              )
                            : SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.only(right: 0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${engToBn(hijriDate.hDay.toString(), context)} ${hijriMonthLocal(hijriDate.longMonthName, context)} ${engToBn(hijriDate.hYear.toString(), context)}",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff36219E)),
                    ),
                    Text(
                      DateFormat("EEEE, dd MMMM",
                              AppLocalizations.of(context)?.localeName)
                          .format(DateTime.now()),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 12.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CurrentPrayer(
                  today: widget.timeOfToday, nextDay: widget.timeOfNextDay),
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "${AppLocalizations.of(context)?.prayerName("Sunrise") ?? ""}  ",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                            ),
                      ),
                      BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
                        builder: (context, state) {
                          return Text(
                            DateFormat('hh:mm a',
                                    AppLocalizations.of(context)?.localeName)
                                .format(
                              () {
                                DateTime sunsetTime =
                                    DateTime.parse(widget.timeOfToday.sunrise!);
                                return DateTime(2023, 1, 1, sunsetTime.hour,
                                        sunsetTime.minute)
                                    .add(Duration(
                                        minutes: state.manualPrayerTime
                                            .manualSunriseTime));
                              }(),
                            ),
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp,
                                    ),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)?.prayerName("Sunset") ?? ""}  ",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 12.sp),
                      ),
                      Text(
                        DateFormat('hh:mm a',
                                AppLocalizations.of(context)?.localeName)
                            .format(
                          () {
                            DateTime sunsetTime =
                                DateTime.parse(widget.timeOfToday.sunset!);
                            return DateTime(
                                2023, 1, 1, sunsetTime.hour, sunsetTime.minute);
                          }(),
                        ),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
