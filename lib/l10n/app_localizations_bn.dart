import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

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
        '1': 'মুহররম',
        '2': 'সফর',
        '3': 'রবিউল আউয়াল',
        '4': 'রবিউছ ছানি',
        '5': 'জামাদিউল আউয়াল',
        '6': 'জামাদিউছ ছানি',
        '7': 'রজব',
        '8': 'শা’বান',
        '9': 'রমাজান',
        '10': 'শাওয়াল',
        '11': 'জিলক্বদ',
        '12': 'জিলহজ্জ',
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
        'Fajr': 'ফজর',
        'Sunrise': 'সূর্যোদয়',
        'Dhuhr': 'যোহর',
        'Asr': 'আছর',
        'Sunset': 'সূর্যাস্ত',
        'Maghrib': 'মাগরিব',
        'Isha': 'ঈশা',
        'Ishrak': 'ইশরাক',
        'other': '\$name',
      },
    );
    return '$_temp0 ';
  }
}
