import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ramadantimes/src/prayer_times/data/repositories/prayer_convention_data.dart';
import 'package:ramadantimes/src/prayer_times/presentation/pages/custom_prayer_time_convention.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../settings/presentation/page/settings_page.dart';
import '../../data/models/prayer_convention_model.dart';
import '../bloc/prayer_time_bloc.dart';

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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SettingsScreen();
                },
              ),
            );
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
      body: BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
        builder: (context, state) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            itemCount: prayerConventionList.length,
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              var item = prayerConventionList[index];
              return InkWell(
                onTap: () {
                  if (item.prayerConventionName == "Custom Angle") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomPrayerTimeConvention(),
                      ),
                    );
                  }
                },
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.prayerConventionName == 'Custom Angle'
                              ? AppLocalizations.of(context)!.customAngles
                              : item.prayerConventionName,
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          getPrayerAngle(context, item, state.selectedFajrAngle,
                              state.selectedIshaAngle),
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        context
                            .read<PrayerTimeBloc>()
                            .add(PrayerTimeEvent.selectPrayerConvention(
                              context: context,
                              prayerConventionName: item.prayerConventionName,
                              fajrAngle: state.selectedFajrAngle,
                              ishaAngle: state.selectedIshaAngle,
                            ));
                      },
                      child: Container(
                        width: 20.w,
                        height: 20.h,
                        padding: EdgeInsets.all(5.w),
                        decoration: BoxDecoration(
                          color: state.selectedPrayerConventionName ==
                                  item.prayerConventionName
                              ? Colors.deepPurple
                              : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: state.selectedPrayerConventionName ==
                                    item.prayerConventionName
                                ? Colors.blue.shade700
                                : Colors.deepPurple,
                            width: state.selectedPrayerConventionName ==
                                    item.prayerConventionName
                                ? 3.0
                                : 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

String getPrayerAngle(
  BuildContext context,
  PrayerConventionModel item,
  double customFajrAngle,
  double customIshaAngle,
) {
  switch (item.prayerConventionName) {
    case 'Custom Angle':
      return "${AppLocalizations.of(context)!.fajrAngle}: $customFajrAngle / ${AppLocalizations.of(context)!.ishaAngle}: $customIshaAngle";
    case 'Umm al-Qura University, Makkah':
      return "${AppLocalizations.of(context)!.fajrAngle}: ${item.fajrAngle} / ${AppLocalizations.of(context)!.ishaInterval}: ${item.ishaAngle.toInt()} ${AppLocalizations.of(context)!.minutes}";
    case 'Tehran':
      return "${AppLocalizations.of(context)!.fajrAngle}: ${item.fajrAngle} / ${AppLocalizations.of(context)!.ishaAngle}: ${item.ishaAngle.toInt()} / ${AppLocalizations.of(context)!.maghribAngle}: 4.5";
    default:
      return "${AppLocalizations.of(context)!.fajrAngle}: ${item.fajrAngle} / ${AppLocalizations.of(context)!.ishaAngle}: ${item.ishaAngle}";
  }
}
