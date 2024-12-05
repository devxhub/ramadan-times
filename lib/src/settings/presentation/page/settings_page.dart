import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          ListTile(
            title: Text('Prayer time conventions'),
            subtitle: Text('Muslim World League (MWL)\n(18.0° / 17.0°)'),
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
}
