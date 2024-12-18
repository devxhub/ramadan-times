import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadantimes/src/services/utility.dart';
import '../../l10n/app_localizations.dart';

class TimeContainerForSehriTime extends StatefulWidget {
  const TimeContainerForSehriTime({
    super.key,
    required this.time,
  });

  final String time;

  @override
  State<TimeContainerForSehriTime> createState() =>
      _TimeContainerForSehriTimeState();
}

class _TimeContainerForSehriTimeState extends State<TimeContainerForSehriTime> {
  bool setReminderForSehri = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.width / 2,
          width: MediaQuery.of(context).size.width / 2,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: const Color(0xffE3DeFF),
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)?.sehriTime ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  formatTo12Hour(widget.time, context),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xff674CEC),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                SizedBox(
                  height: 24.h,
                  // width: 36,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CupertinoSwitch(
                        activeColor: const Color(0xff6348eb),
                        trackColor: Colors.blueGrey.shade50,
                        value: setReminderForSehri,
                        onChanged: (v) {
                          setState(() {
                            setReminderForSehri = v;
                          });
                        }),
                  ),
                )
              ]),
        ),
        Positioned(
          bottom: 20,
          right: 8,
          child: Image.asset(
            "assets/images/sehriMoon.png",
            height: 60.h,
            width: 60.w,
          ),
        )
      ],
    );
  }
}
