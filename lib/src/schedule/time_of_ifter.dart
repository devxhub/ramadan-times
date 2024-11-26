import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20),
          decoration: BoxDecoration(
            color: const Color(0xffFFEABF),
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AutoSizeText(
                  AppLocalizations.of(context)?.ifterTime ?? "",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 18.sp,
                      height: 1.47,
                      color: const Color(0xff1C1646),
                      fontWeight: FontWeight.w700),
                ),
                AutoSizeText.rich(
                  TextSpan(
                    text: formatIftarTime(widget.ifterTime),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        height: 1.4,
                        color: const Color(0xff674cec),
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
            "assets/images/iftarCloud.png",
            height: 60,
            width: 60.w,
          ),
        )
      ],
    );
  }
}
