import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatTo12Hour(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString.replaceFirst(' ', 'T'))
      .subtract(Duration(minutes: 5));
  return DateFormat('hh:mm a').format(dateTime);
}

String formatIftarTime(String time) {
  try {
    final dateTime = DateTime.parse(time);
    return DateFormat("hh:mm a").format(dateTime);
  } catch (e) {
    debugPrint("Error parsing ifterTime: $e");
    return "Invalid Time";
  }
}
