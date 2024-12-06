import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get prohibitedPrayerTimes => 'Kielletty rukousaika';

  @override
  String get morning => 'Aamu';

  @override
  String get noon => 'Keskipäivä';

  @override
  String get evening => 'Ilta';

  @override
  String get month => 'Kuukausi';

  @override
  String get twoWeek => 'kaksi viikkoa';

  @override
  String get week => 'viikko';

  @override
  String get locationSettings => 'Sijaintiasetukset';

  @override
  String get selectYourCountry => 'Valitse maasi';

  @override
  String get selectCountry => 'Valitse maa';

  @override
  String get selectYourCity => 'Valitse kaupunkisi';

  @override
  String get selectACity => 'Valitse kaupunki';

  @override
  String get selectYourDistrict => 'Select Your District';

  @override
  String get pleaseSelectYourCity => 'Valitse kaupunki';

  @override
  String get save => 'Tallenna';

  @override
  String get quran => 'Koraani';

  @override
  String get prayerTimes => 'Rukousajat';

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
  String get afterIsha => 'Ishan jälkeen';

  @override
  String get english => 'Englanti';

  @override
  String get bangla => 'Bengali';

  @override
  String get finnish => 'Suomi';

  @override
  String get schedule => 'Aikataulu';

  @override
  String get maslaMasail => 'Masala - Masael';

  @override
  String get calendar => 'Kalenteri';

  @override
  String get ramadanMubarak => 'Ramadan Mubarak';

  @override
  String get nextPrayer => 'Viimeinen rukous';

  @override
  String get sehriTime => 'Sehrin aika';

  @override
  String get ifterTime => 'Iftarin aika';

  @override
  String get remaining => 'Aikaa jäljellä';

  @override
  String get ofIfter => 'Iftarin';

  @override
  String get ofSehri => 'Sehrin';

  @override
  String get nextDay => 'Seuraavan päivän';

  @override
  String get sehri => 'Sehri';

  @override
  String get sehriDua => 'Sehrin Dua';

  @override
  String get ifter => 'Iftar';

  @override
  String get ifterDua => 'Iftarin Dua';

  @override
  String get changeAppLanguage => 'Vaihda sovelluksen kieli';

  @override
  String get changeAppLocation => 'Vaihda sijainti';

  @override
  String get shareApp => 'Jaa sovellus';

  @override
  String get rateThisApp => 'Arvostele tämä sovellus';

  @override
  String get chooseYourLanguage => 'Valitse kielesi';

  @override
  String get chooseYourLocation => 'Valitse sijaintisi';

  @override
  String get hijriDate => 'Hijri-päivämäärä';

  @override
  String get prayer => 'Rukous';

  @override
  String get privacyPolicy => 'Tietosuojakäytäntö';

  @override
  String get timeRemaining => 'Aikaa jäljellä';

  @override
  String greetings(String userName) {
    return 'Tervetuloa $userName';
  }

  @override
  String formattedTime(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.jm(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String arabicDate(String day, String month, String year) {
    return '$day $month, $year AH';
  }

  @override
  String prayerName(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'Fajr': 'Fajr',
        'Sunrise': 'Auringonnousu',
        'Dhuhr': 'Dhuhr',
        'Asr': 'Asr',
        'Sunset': 'Auringonlasku',
        'Maghrib': 'Maghrib',
        'Isha': 'Isha',
        'FajrNext': 'Fajr',
        'other': 'name',
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
