import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../l10n/app_localizations.dart';
import '../services/utility.dart';

class TimeContainerForIftarTime extends StatefulWidget {
  const TimeContainerForIftarTime({
    super.key,
    required this.ifterTime,
  });

  final String ifterTime;

  @override
  State<TimeContainerForIftarTime> createState() =>
      _TimeContainerForIftarTimeState();
}

class _TimeContainerForIftarTimeState extends State<TimeContainerForIftarTime> {
  bool setReminderForSehri = false;

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
            color: const Color(0xffFFEABF),
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)?.ifterTime ?? "",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 18.sp,
                      color: const Color(0xff1C1646),
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  formatIftarTime(widget.ifterTime, context),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xff674cec),
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
            "assets/images/iftarCloud.png",
            height: 60.h,
            width: 60.w,
          ),
        )
      ],
    );
  }
}
