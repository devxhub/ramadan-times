import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ramadantimes/src/prayer_times/data/repositories/prayer_convention_data.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/models/prayer_convention_model.dart';

class PrayerTimeConvention extends StatefulWidget {
  const PrayerTimeConvention({super.key});

  @override
  State<PrayerTimeConvention> createState() => _PrayerTimeConventionState();
}

class _PrayerTimeConventionState extends State<PrayerTimeConvention> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.goNamed("schedule");
          },
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: CircleAvatar(
              radius: 15.r,
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.prayerTimeConvention,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
        itemCount: prayerConventionList.length,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (context, index) {
          var item = prayerConventionList[index];
          return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.conventionName,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    getPrayerAngle(context, item),
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

String getPrayerAngle(BuildContext context, PrayerConventionModel item) {
  return "${AppLocalizations.of(context)!.fajrAngle}: ${item.fajrAngle} / ${AppLocalizations.of(context)!.ishaAngle}: ${item.ishaAngle}";
}
