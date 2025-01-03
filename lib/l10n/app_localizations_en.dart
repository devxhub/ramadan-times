import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get prohibitedPrayerTimes => 'Prohibited Prayer Times';

  @override
  String get morning => 'Morning';

  @override
  String get noon => 'Noon';

  @override
  String get evening => 'Evening';

  @override
  String get month => 'Month';

  @override
  String get twoWeek => 'Two Weeks';

  @override
  String get week => 'Week';

  @override
  String get locationSettings => 'Location Settings';

  @override
  String get selectYourCountry => 'Select Your Country';

  @override
  String get selectCountry => 'Select a Country';

  @override
  String get selectYourCity => 'Select Your City';

  @override
  String get selectACity => 'Select a City';

  @override
  String get selectYourDistrict => 'Select Your District';

  @override
  String get pleaseSelectYourCity => 'Please select a city';

  @override
  String get save => 'Save';

  @override
  String get quran => 'Quran';

  @override
  String get prayerTimes => 'Prayer Times';

  @override
  String get fajr => 'Fajr';

  @override
  String get dhuhr => 'Dhuhr';

  @override
  String get asr => 'Asr';

  @override
  String get maghrib => 'Maghrib';

  @override
  String get isha => 'Isha';

  @override
  String get awabin => 'Awabin';

  @override
  String get tahajjud => 'Tahajjud';

  @override
  String get afterIsha => 'After Isha';

  @override
  String get english => 'English';

  @override
  String get bangla => 'Bangla';

  @override
  String get finnish => 'Finnish';

  @override
  String get schedule => 'Schedule';

  @override
  String get maslaMasail => 'Masala - Masael';

  @override
  String get calendar => 'Calendar';

  @override
  String get ramadanMubarak => 'Ramadan Mubarak';

  @override
  String get nextPrayer => 'last prayer';

  @override
  String get sehriTime => 'Sehri time';

  @override
  String get ifterTime => 'Iftar time';

  @override
  String get remaining => 'Time remaining';

  @override
  String get ofIfter => 'of Iftar';

  @override
  String get ofSehri => 'of Sehri';

  @override
  String get nextDay => 'Next day\'s';

  @override
  String get sehri => 'Sehri';

  @override
  String get sehriDua => 'Sehri\'s Dua';

  @override
  String get ifter => 'Iftar';

  @override
  String get ifterDua => 'Iftar\'s Dua';

  @override
  String get changeAppLanguage => 'Change the language';

  @override
  String get changeAppLocation => 'Change location';

  @override
  String get shareApp => 'Share the app';

  @override
  String get rateThisApp => 'Rate this app';

  @override
  String get chooseYourLanguage => 'Select your language';

  @override
  String get chooseYourLocation => 'Select your location';

  @override
  String get hijriDate => 'Hijri date';

  @override
  String get prayer => 'Prayer';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get timeRemaining => 'Remaining Time';

  @override
  String greetings(String userName) {
    return 'Welcome $userName';
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
        'FajrNext': 'Fajr',
        'other': 'Fajr',
      },
    );
    return '$_temp0, ';
  }

  @override
  String get prayerTimeConvention => 'Prayer Time Convention';

  @override
  String get customAngles => 'Custom Angle';

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

  @override
  String get selectFajrAngle => 'Select Fajr Angle:';

  @override
  String get selectIshaAngle => 'Select Isha Angle:';

  @override
  String get showImsakInPrayerTimesPage => 'Show Imsak in Prayer Times page';

  @override
  String get manualCorrection => 'Manual Corrections';

  @override
  String get minute => 'minute';

  @override
  String get selectedTime => 'Selected Time';

  @override
  String get sunRise => 'Sun Rise';

  @override
  String get resetTime => 'Reset Time';

  @override
  String get done => 'Done';

  @override
  String get cancel => 'Cancel';

  @override
  String get playAyah => 'Play Ayah';

  @override
  String get playSurah => 'Play Surah';

  @override
  String get pauseAyah => 'Pause Ayah';

  @override
  String get pauseSurah => 'Pause Surah';

  @override
  String get onInternetConnection => 'No internet connection. Please turn on internet';

  @override
  String get translation => 'Translation';

  @override
  String get transliteration => 'Transliteration';

  @override
  String get revealedIn => 'Revealed in';

  @override
  String get nowPlaying => 'Now Playing';

  @override
  String get ayah => 'Ayah';

  @override
  String get makkah => 'Makkah';

  @override
  String get madinah => 'Madinah';

  @override
  String get searchSurah => 'Search Surah...';

  @override
  String get imsak => 'Imsak';

  @override
  String get autoDetectLocation => 'Auto-detect Location';

  @override
  String get prayerTimeCalculation => 'Prayer Time Calculation';

  @override
  String get minutesBeforeFajr => 'minutes before Fajr';

  @override
  String get settings => 'Settings';

  @override
  String get selectUserLocation => 'Select user location';

  @override
  String get noResultsFound => 'No results found';

  @override
  String get selectACountry => 'Select a Country';

  @override
  String get pleaseSelectACity => 'Please Select a city';

  @override
  String get countrySavedSuccessfully => 'Country saved successfully!';

  @override
  String get countryIsNotFoundInTheList => 'Country is not found in the list!';
}
