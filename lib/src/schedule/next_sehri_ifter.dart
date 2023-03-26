import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/src/models/timing/timing.dart' as timing;

import '../../l10n/app_localizations.dart';

class NextSehriIftar extends StatelessWidget {
  const NextSehriIftar({
    super.key,
    required this.data,
  });
  final timing.Timing data;

  @override
  Widget build(BuildContext context) {
    // context.read<NextDayTimingCubit>().loadNextData();
    return Container(
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color(0xffD9DFE0),
              const Color(0xffFFFFFF).withOpacity(0),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            color: Colors.white,
            borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      AppLocalizations.of(context)?.nextDay ?? "",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(),
                    ),
                    AutoSizeText(
                      AppLocalizations.of(context)?.sehri ?? "",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: const Color(0xff674cec),
                          height: 1,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                      color: const Color(0xfff2f2f7),
                      borderRadius: BorderRadius.circular(15)),
                  child: AutoSizeText.rich(
                    TextSpan(
                      text: DateFormat.jm("bn_BD").format(
                        DateTime(
                                2023,
                                1,
                                1,
                                int.parse(data.data?.timings?.fajr
                                        ?.split(":")
                                        .first ??
                                    "0"),
                                int.parse(
                                    data.data?.timings?.fajr?.split(":").last ??
                                        "0"))
                            .subtract(const Duration(minutes: 5)),
                      ),

                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: const Color(0xff674cec),
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp),
                      // children: [
                      // TextSpan(
                      //     text: "AM",
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .bodySmall
                      //         ?.copyWith(
                      //             color: const Color(0xffffa600))),
                      // ],
                    ),
                  ),
                )
              ],
            ),
            const Divider(),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      AppLocalizations.of(context)?.nextDay ?? "",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    AutoSizeText(
                      AppLocalizations.of(context)?.ifter ?? "",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: const Color(0xff674cec),
                          height: 1,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                      color: const Color(0xffD9DFE0).withOpacity(.54),
                      borderRadius: BorderRadius.circular(15)),
                  child: AutoSizeText.rich(
                    TextSpan(
                      text: DateFormat.jm("bn_BD").format(
                        DateTime(
                                2023,
                                1,
                                1,
                                int.parse(data.data?.timings?.maghrib
                                        ?.split(":")
                                        .first ??
                                    "0"),
                                int.parse(data.data?.timings?.maghrib
                                        ?.split(":")
                                        .last ??
                                    "0"))
                            .add(const Duration(minutes: 4)),
                      ),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: const Color(0xff674cec),
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
