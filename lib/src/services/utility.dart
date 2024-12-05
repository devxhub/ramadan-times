import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../l10n/app_localizations.dart';

String formatTo12Hour(String dateTimeString, BuildContext context) {
  DateTime dateTime = DateTime.parse(dateTimeString.replaceFirst(' ', 'T'))
      .subtract(Duration(minutes: 5));
  return DateFormat('hh:mm a', AppLocalizations.of(context)?.localeName).format(dateTime);
}

String formatIftarTime(String time, BuildContext context) {
  try {
    final dateTime = DateTime.parse(time);
    return DateFormat('hh:mm a', AppLocalizations.of(context)?.localeName).format(dateTime);
  } catch (e) {
    debugPrint("Error parsing ifterTime: $e");
    return "Invalid Time";
  }
}
