import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/src/schedule/schedule.dart';

import '../../l10n/app_localizations.dart';
import '../component/eng_to_bn.dart';
import '../models/timing/timing.dart';
import 'current_prayer.dart';

class TodayInfoCard extends StatefulWidget {
  final Timing timeOfToday;
  final Timing timeOfNextDay;
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
    return Container(
      // height: 200,
      width: 375.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16),
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
              const Spacer(),

              Container(
                // height: 100,
                width: 200,
                padding: EdgeInsets.only(right: 0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AutoSizeText(
                      AppLocalizations.of(context)!.localeName == "bn"
                          ? engToBn(AppLocalizations.of(context)?.arabicDate(
                                  (int.parse(widget.timeOfToday.data?.date?.hijri?.day ?? "") -
                                          1)
                                      .toString(),
                                  widget.timeOfToday.data?.date?.hijri?.month
                                          ?.number
                                          .toString() ??
                                      "",
                                  widget.timeOfToday.data?.date?.hijri?.year ??
                                      "") ??
                              "")
                          : AppLocalizations.of(context)?.arabicDate(
                                  widget.timeOfToday.data?.date?.hijri?.day ??
                                      "",
                                  widget.timeOfToday.data?.date?.hijri?.month?.en
                                          .toString() ??
                                      "",
                                  widget.timeOfToday.data?.date?.hijri?.year ??
                                      "") ??
                              "",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          height: 1.4,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff36219E)),
                    ),
                    AutoSizeText(
                      DateFormat("EEEE, dd MMMM", "bn").format(DateTime.now()),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 12.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              // Image.asset(
              //   "assets/images/image1.png",
              //   height: 80,
              //   width: 110.w,
              // ),
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
                      AutoSizeText(
                        "${AppLocalizations.of(context)?.prayerName("Sunrise") ?? ""}  ",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp, ),
                      ),
                      AutoSizeText(
                        DateFormat.jm("bn_BD").format(DateTime(
                            2023,
                            1,
                            1,
                            int.parse(widget.timeOfToday.data?.timings?.sunrise
                                    ?.split(":")
                                    .first ??
                                "0"),
                            int.parse(widget.timeOfToday.data?.timings?.sunrise
                                    ?.split(":")
                                    .last ??
                                "0"))),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 12.sp),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        "${AppLocalizations.of(context)?.prayerName("Sunset") ?? ""}  ",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 12.sp),
                      ),
                      AutoSizeText(
                        DateFormat.jm("bn_BD").format(DateTime(
                            2023,
                            1,
                            1,
                            int.parse(widget.timeOfToday.data?.timings?.sunset
                                    ?.split(":")
                                    .first ??
                                "0"),
                            int.parse(widget.timeOfToday.data?.timings?.sunset
                                    ?.split(":")
                                    .last ??
                                "0")))
                        // engToBn(
                        //   widget.timeOfToday.data?.timings?.sunset ?? "",
                        // ),
                        ,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 12.sp),
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
