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
  String get prayerTimeConvention => 'Rukousajan käytäntö';

  @override
  String get customAngles => 'Mukautetut kulmat';

  @override
  String get fajrAngle => 'Fajr-kulma';

  @override
  String get ishaAngle => 'Isha-kulma';

  @override
  String get ishaInterval => 'Isha-väli';

  @override
  String get minutes => 'minuuttia';

  @override
  String get maghribAngle => 'Maghrib-kulma';

  @override
  String get selectFajrAngle => 'Valitse Fajr-kulma:';

  @override
  String get selectIshaAngle => 'Valitse Isha-kulma:';

  @override
  String get showImsakInPrayerTimesPage => 'Näytä Imsak rukousaikojen sivulla ja viimeistele';

  @override
  String get manualCorrection => 'Manuaaliset korjaukset';

  @override
  String get minute => 'minuuttia';

  @override
  String get selectedTime => 'Valittu aika';

  @override
  String get sunRise => 'Auringon nousu';

  @override
  String get resetTime => 'Nollaa aika';

  @override
  String get done => 'Valmis';

  @override
  String get cancel => 'Peruuta';

  @override
  String get playAyah => 'Toista ayah';

  @override
  String get playSurah => 'Toista sura';

  @override
  String get onInternetConnection => 'Ei internet-yhteyttä. Kytke internet päälle';

  @override
  String get translation => 'Käännös';

  @override
  String get transliteration => 'Transliteraatio';

  @override
  String get revealedIn => 'Ilmestynyt';

  @override
  String get nowPlaying => 'Nyt toistetaan';

  @override
  String get ayah => 'Ayah';

  @override
  String get makkah => 'Mekka';

  @override
  String get madinah => 'Medina';

  @override
  String get searchSurah => 'Etsi sura...';

  @override
  String get imsak => 'Imsak';

  @override
  String get autoDetectLocation => 'Automaattinen sijainnin tunnistus';

  @override
  String get prayerTimeCalculation => 'Rukousaikojen laskenta';

  @override
  String get minutesBeforeFajr => 'minuuttia ennen Fajr';

  @override
  String get settings => 'Asetukset';

  @override
  String get selectUserLocation => 'Valitse käyttäjän sijainti';

  @override
  String get noResultsFound => 'Ei tuloksia';

  @override
  String get selectACountry => 'Valitse maa';

  @override
  String get pleaseSelectACity => 'Valitse kaupunki';

  @override
  String get countrySavedSuccessfully => 'Maa tallennettu onnistuneesti!';

  @override
  String get countryIsNotFoundInTheList => 'Maata ei löytynyt luettelosta!';

  @override
  String get passwordMustBeAtLeast8Characters => 'Password must be at least 8 characters.';

  @override
  String get pleaseEnterYourEmailAddress => 'Please enter your email address';

  @override
  String get pleaseEnterYourPassword => 'Syötä salasanasi';

  @override
  String get signUpTitle => 'Rekisteröidy';

  @override
  String get gettingStarted => 'Aloitetaan';

  @override
  String get createAccount => 'Luo tili jatkaaksesi!';

  @override
  String get nameLabel => 'Nimi';

  @override
  String get nameHint => 'Syötä nimesi';

  @override
  String get emailLabel => 'Sähköpostisi';

  @override
  String get emailHint => 'Syötä sähköpostisi';

  @override
  String get passwordLabel => 'Salasana';

  @override
  String get passwordHint => 'Syötä salasanasi';

  @override
  String get confirmPasswordLabel => 'Vahvista salasana';

  @override
  String get confirmPasswordHint => 'Syötä vahvistussalasanasi';

  @override
  String get signUpButton => 'Rekisteröidy';

  @override
  String get alreadyHaveAccount => 'Onko sinulla jo tili?';

  @override
  String get signIn => 'Kirjaudu sisään';

  @override
  String get pleaseEnterYourEmail => 'Syötä sähköpostiosoitteesi';

  @override
  String get passwordTooShort => 'Salasanan on oltava vähintään 8 merkkiä pitkä';

  @override
  String get confirmPasswordError => 'Vahvistussalasanan on oltava sama kuin salasana';

  @override
  String get pleaseEnterAValidEmailAddress => 'Anna kelvollinen sähköpostiosoite';
}
