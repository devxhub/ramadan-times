import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get schedule => 'সময়সূচী';

  @override
  String get maslaMasail => 'মাসআলা- মাসায়েল';

  @override
  String get calendar => 'ক্যালেন্ডার';

  @override
  String get ramadanMubarak => 'রমজান মুবারক';

  @override
  String get nextPrayer => 'পরবতী নামাজ';

  @override
  String get sehriTime => 'সেহরির সময়';

  @override
  String get ifterTime => 'ইফতারের সময়';

  @override
  String get remaining => 'সময় বাকি';

  @override
  String get ofIfter => 'ইফতারের';

  @override
  String get ofSehri => 'সেহরির';

  @override
  String get nextDay => 'পরবর্তী দিনের';

  @override
  String get sehri => 'সেহরি';

  @override
  String get sehriDua => 'সেহরির দোয়া';

  @override
  String get ifter => 'ইফতার';

  @override
  String get ifterDua => 'ইফতারের দোয়া';

  @override
  String get changeAppLanguage => 'ভাষা পরিবর্তন করুন';

  @override
  String get changeAppLocation => 'অবস্থান পরিবর্তন করুন';

  @override
  String get shareApp => 'শেয়ার করুন';

  @override
  String get rateThisApp => 'রেটিং দিন';

  @override
  String get chooseYourLanguage => 'আপনার ভাষা নির্বাচন করুন';

  @override
  String get chooseYourLocation => 'আপনার অবস্থান নির্বাচন করুন';

  @override
  String get save => 'সংরক্ষণ করুন';

  @override
  String get hijriDate => 'হিজরি তারিখ';

  @override
  String get prayer => 'নামায';

  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get timeRemaining => 'সময় বাকি';

  @override
  String greetings(String userName) {
    return 'স্বাগতম $userName';
  }

  @override
  String get quran => 'Quran';

  @override
  String formattedTime(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.jm(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String arabicDate(String day, String month, String year) {
    String _temp0 = intl.Intl.selectLogic(
      month,
      {
        '1': 'Muharram',
        '2': 'Safar',
        '3': 'Rabiul Awwal',
        '4': 'Rabiul Thani',
        '5': 'Jumada Al-Awwal',
        '6': 'Jumada Al-Thani',
        '7': 'Rajab',
        '8': 'Sha’ban',
        '9': 'Ramadan',
        '10': 'Shawwal',
        '11': 'Dhul Qadah',
        '12': 'Dhul Hijjah',
        'other': '',
      },
    );
    return '$day $_temp0';
  }

  @override
  String prayerName(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'Fajr': 'Fajr',
        'Sunrise': 'Sunrise',
        'Dhuhr': 'Dhuhr',
        'Asr': 'Asr',
        'Sunset': 'Sunset',
        'Maghrib': 'Maghrib',
        'Isha': 'Isha',
        'FajrNext': 'Fajr (Next Day)',
        'other': 'Fajr',
      },
    );
    return '$_temp0, ';
  }

  @override
  String get prayerTimeConvention => 'Prayer Time Convention';

  @override
  String get customAngles => 'Custom Angles';

  @override
  String get fajrAngle => 'Fajr Angle';

  @override
  String get ishaAngle => 'Isha Angle';

  @override
  String get ishaInterval => 'Isha Interval';

  @override
  String get minutes => 'minutes';

  @override
  String get maghribAngle => 'Maghrib Angle';
}
