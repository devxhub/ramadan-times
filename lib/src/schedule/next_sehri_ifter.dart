import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslimtimespro/src/prayer_times/data/models/prayer_times.dart';
import '../../l10n/app_localizations.dart';
import '../services/utility.dart';

class NextSehriIftar extends StatelessWidget {
  const NextSehriIftar({
    super.key,
    required this.data,
  });
  final PrayerTimesResponse data;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 24.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color(0xffD9DFE0),
              const Color(0xffFFFFFF).withOpacity(0),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r)),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)?.nextDay ?? "",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      AppLocalizations.of(context)?.sehri ?? "",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: const Color(0xff674cec),
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
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Text(
                    formatTo12Hour(data.fajrStart!, context),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: const Color(0xff674cec),
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp),
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
                    Text(
                      AppLocalizations.of(context)?.nextDay ?? "",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      AppLocalizations.of(context)?.ifter ?? "",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: const Color(0xff674cec),
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
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Text(
                    formatTo12Hour(data.maghribStart!, context),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: const Color(0xff674cec),
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
