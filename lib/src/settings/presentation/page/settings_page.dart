import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../prayer_times/presentation/bloc/prayer_time_bloc.dart';
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
        title: Text('Prayer Times'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          SwitchListTile(
            title: Text('Show Imsak in Prayer Times page'),
            value: showImsak,
            onChanged: (value) {
              setState(() {
                showImsak = value;
              });
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Prayer Time Calculation',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text('Location'),
            subtitle: Text('-'),
          ),
          SwitchListTile(
            title: Text('Auto-detect Location'),
            value: autoDetectLocation,
            onChanged: (value) {
              setState(() {
                autoDetectLocation = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Automatic settings'),
            value: automaticSettings,
            onChanged: (value) {
              setState(() {
                automaticSettings = value;
              });
            },
          ),
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
          ListTile(
            title: Text('Manual corrections'),
            subtitle: Text('0, 0, 0, 0, 0, 0'),
          ),
          ListTile(
            title: Text('Asr calculation – Juristic method'),
            subtitle: Text('Standard (Shafi, Maliki, Hanbali)'),
          ),
          ListTile(
            title: Text('High Latitude Adjustment'),
            subtitle: Text('Angle-based method'),
          ),
          ListTile(
            title: Text('Daylight Saving Time'),
            subtitle: Text('Auto'),
          ),
          ListTile(
            title: Text('Imsak'),
            subtitle: Text('0 minutes before Fajr'),
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
