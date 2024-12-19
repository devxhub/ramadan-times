import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadantimes/src/component/eng_to_bn.dart';
import 'package:ramadantimes/src/prayer_times/presentation/bloc/prayer_time_bloc.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../prayer_times/presentation/pages/manual_prayer_time.dart';
import '../../../prayer_times/presentation/pages/prayer_time_convention.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool showImsak = false;
  bool autoDetectLocation = true;
  bool automaticSettings = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.prayerTimes),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
            builder: (context, state) {
              return SwitchListTile(
                title: Text(
                    AppLocalizations.of(context)!.showImsakInPrayerTimesPage),
                value: state.isImsakEnable,
                onChanged: (value) {
                  context.read<PrayerTimeBloc>().add(
                      PrayerTimeEvent.isImsakTimeShow(
                          context: context, isImsakEnable: value));
                },
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.prayerTimeCalculation,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // ListTile(
          //   title: Text('Location'),
          //   subtitle: Text('-'),
          // ),
          BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
            builder: (context, state) {
              return SwitchListTile(
                title: Text(AppLocalizations.of(context)!.autoDetectLocation),
                value: state.isAutoDetectLocationEnable,
                onChanged: (value) {
                  context.read<PrayerTimeBloc>().add(
                      PrayerTimeEvent.autoDetectLocationStatusChange(
                          context: context, isAutoDetectLocationEnable: value));
                },
              );
            },
          ),
          // SwitchListTile(
          //   title: Text('Automatic settings'),
          //   value: automaticSettings,
          //   onChanged: (value) {
          //     setState(() {
          //       automaticSettings = value;
          //     });
          //   },
          // ),
          BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
            builder: (context, state) {
              return ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PrayerTimeConvention();
                      },
                    ),
                  );
                },
                title: Text(AppLocalizations.of(context)!.prayerTimeConvention),
                subtitle: Text(
                  "${state.selectedPrayerConventionName == 'Custom Angle' ? AppLocalizations.of(context)!.customAngles : state.selectedPrayerConventionName}\n${getPrayerAngle(context, state.selectedPrayerConventionName, state.selectedFajrAngle, state.selectedIshaAngle)}",
                ),
              );
            },
          ),
          BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManualCorrectionsScreen(),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(AppLocalizations.of(context)!.manualCorrection),
                  subtitle: Text(
                      '${state.manualPrayerTime.manualFajrTime ?? 0},${state.manualPrayerTime.manualSunriseTime ?? 0}, ${state.manualPrayerTime.manualDhuhrTime ?? 0}, ${state.manualPrayerTime.manualAsrTime ?? 0}, ${state.manualPrayerTime.manualMaghribTime ?? 0},${state.manualPrayerTime.manualIshaTime ?? 0}'),
                ),
              );
            },
          ),
          // ListTile(
          //   title: Text('Asr calculation – Juristic method'),
          //   subtitle: Text('Standard (Shafi, Maliki, Hanbali)'),
          // ),
          // ListTile(
          //   title: Text('High Latitude Adjustment'),
          //   subtitle: Text('Angle-based method'),
          // ),
          // ListTile(
          //   title: Text('Daylight Saving Time'),
          //   subtitle: Text('Auto'),
          // ),
          BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          AppLocalizations.of(context)!.imsak,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        content: SizedBox(
                          width: double.maxFinite,
                          height: 400, // Adjust the height as needed
                          child: ListView.builder(
                            itemCount: 31, // Number of options
                            itemBuilder: (context, index) {
                              return RadioListTile<int>(
                                value: index,
                                groupValue: state.imsakTime,
                                onChanged: (value) {
                                  context.read<PrayerTimeBloc>().add(
                                      PrayerTimeEvent.selectCustomImsakTime(
                                          customImsakTime: value ?? 0));
                                  Navigator.pop(
                                      context); // Close dialog on selection
                                },
                                title: Text(
                                  '${engToBn(index.toString(), context)} ${AppLocalizations.of(context)!.localeName == "fi" ? index > 1 ? "minuuttia" : "minuutti" : "${AppLocalizations.of(context)!.minute}${AppLocalizations.of(context)!.localeName == "en" && index > 1 ? "s" : ""}"} ',
                                  style: TextStyle(fontSize: 16),
                                ),
                                activeColor:
                                    Colors.teal, // Matches your screenshot
                              );
                            },
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              AppLocalizations.of(context)!.cancel,
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: ListTile(
                  title: Text(AppLocalizations.of(context)!.imsak),
                  subtitle: Text(
                      '${state.imsakTime} ${AppLocalizations.of(context)!.minutesBeforeFajr}'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String getPrayerAngle(
    BuildContext context,
    String prayerConventionName,
    double customFajrAngle,
    double customIshaAngle,
  ) {
    switch (prayerConventionName) {
      case 'Custom Angle':
        return "${AppLocalizations.of(context)!.fajrAngle}: $customFajrAngle / ${AppLocalizations.of(context)!.ishaAngle}: $customIshaAngle";
      case 'Muslim World League':
        return "${AppLocalizations.of(context)!.fajrAngle}: 18.0° / ${AppLocalizations.of(context)!.ishaInterval}: 17.0°";
      case 'Egyptian General Authority of Survey':
        return "${AppLocalizations.of(context)!.fajrAngle}: 19.5° / ${AppLocalizations.of(context)!.ishaInterval}: 17.5°";
      case 'University of Islamic Sciences, Karachi':
        return "${AppLocalizations.of(context)!.fajrAngle}: 18.0° / ${AppLocalizations.of(context)!.ishaInterval}: 18.0°";
      case 'Umm al-Qura University, Makkah':
        return "${AppLocalizations.of(context)!.fajrAngle}: 18.0° / ${AppLocalizations.of(context)!.ishaInterval}: 90 ${AppLocalizations.of(context)!.minutes}";
      case 'UAE':
        return "${AppLocalizations.of(context)!.fajrAngle}: 18.2° / ${AppLocalizations.of(context)!.ishaInterval}: 18.2°";
      case 'Kuwait':
        return "${AppLocalizations.of(context)!.fajrAngle}: 18.0° / ${AppLocalizations.of(context)!.ishaInterval}: 17.5°";
      case 'Moonsighting Committee':
        return "${AppLocalizations.of(context)!.fajrAngle}: 18.0° / ${AppLocalizations.of(context)!.ishaInterval}: 18.0°";
      case 'Singapore':
        return "${AppLocalizations.of(context)!.fajrAngle}: 20.0° / ${AppLocalizations.of(context)!.ishaInterval}: 18.0°";
      case 'ISNA method':
        return "${AppLocalizations.of(context)!.fajrAngle}: 15.0° / ${AppLocalizations.of(context)!.ishaInterval}: 15.0°";
      case 'Turkey':
        return "${AppLocalizations.of(context)!.fajrAngle}: 18.0° / ${AppLocalizations.of(context)!.ishaAngle}: 17.0° ";
      case 'Tehran':
        return "${AppLocalizations.of(context)!.fajrAngle}: 18.0° / ${AppLocalizations.of(context)!.ishaAngle}: 17.0° / ${AppLocalizations.of(context)!.maghribAngle}: 4.5";
      default:
        return "${AppLocalizations.of(context)!.fajrAngle}: 0.0° / ${AppLocalizations.of(context)!.ishaAngle}: 0.0°";
    }
  }
}
