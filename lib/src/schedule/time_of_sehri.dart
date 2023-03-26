import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: const Color(0xffE3DeFF),
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AutoSizeText(
                  AppLocalizations.of(context)?.sehriTime ?? "",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 18.sp,
                      height: 1.47,
                      fontWeight: FontWeight.bold),
                ),
                AutoSizeText.rich(
                  TextSpan(
                    text: DateFormat.jm("bn_BD").format(
                      DateTime(
                              2023,
                              1,
                              1,
                              int.parse(widget.time.split(":").first),
                              int.parse(widget.time.split(":").last))
                          .subtract(const Duration(minutes: 5)),
                    ),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        height: 1.4,
                        color: const Color(0xff674CEC),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 24.spMin,
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
            height: 60,
            width: 60.w,
          ),
        )
      ],
    );
  }
}