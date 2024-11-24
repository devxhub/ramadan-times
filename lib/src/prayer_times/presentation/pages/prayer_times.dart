import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrayerTimesScreen extends StatefulWidget {
  @override
  _PrayerTimesScreenState createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  // Define your location (latitude, longitude) ,

  final coordinates = Coordinates(22.331953903827902, 91.7746347460252); // Example: London
  // final calculationMethod = CalculationMethod.isna(); // or other calculation methods
  CalculationParameters calculationMethod = CalculationParameters(
    method: CalculationMethod.muslim_world_league,
    fajrAngle: 18.0,
    ishaAngle: 17.0,
    ishaInterval: 0,
    madhab: Madhab.hanafi,
    highLatitudeRule: HighLatitudeRule.middle_of_the_night,
  );
  // Generate prayer times for the year
  List<String> prayerTimes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Times for the Year'),
      ),
      body: ListView.builder(
        itemCount: prayerTimes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(prayerTimes[index]),
          );
        },
      ),
    );
  }
}