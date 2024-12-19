import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
    Locale('fi')
  ];

  /// No description provided for @prohibitedPrayerTimes.
  ///
  /// In en, this message translates to:
  /// **'Prohibited Prayer Times'**
  String get prohibitedPrayerTimes;

  /// No description provided for @morning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get morning;

  /// No description provided for @noon.
  ///
  /// In en, this message translates to:
  /// **'Noon'**
  String get noon;

  /// No description provided for @evening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get evening;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @twoWeek.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks'**
  String get twoWeek;

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get week;

  /// No description provided for @locationSettings.
  ///
  /// In en, this message translates to:
  /// **'Location Settings'**
  String get locationSettings;

  /// No description provided for @selectYourCountry.
  ///
  /// In en, this message translates to:
  /// **'Select Your Country'**
  String get selectYourCountry;

  /// No description provided for @selectCountry.
  ///
  /// In en, this message translates to:
  /// **'Select a Country'**
  String get selectCountry;

  /// No description provided for @selectYourCity.
  ///
  /// In en, this message translates to:
  /// **'Select Your City'**
  String get selectYourCity;

  /// No description provided for @selectACity.
  ///
  /// In en, this message translates to:
  /// **'Select a City'**
  String get selectACity;

  /// No description provided for @selectYourDistrict.
  ///
  /// In en, this message translates to:
  /// **'Select Your District'**
  String get selectYourDistrict;

  /// No description provided for @pleaseSelectYourCity.
  ///
  /// In en, this message translates to:
  /// **'Please select a city'**
  String get pleaseSelectYourCity;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @quran.
  ///
  /// In en, this message translates to:
  /// **'Quran'**
  String get quran;

  /// No description provided for @prayerTimes.
  ///
  /// In en, this message translates to:
  /// **'Prayer Times'**
  String get prayerTimes;

  /// No description provided for @fajr.
  ///
  /// In en, this message translates to:
  /// **'Fajr'**
  String get fajr;

  /// No description provided for @dhuhr.
  ///
  /// In en, this message translates to:
  /// **'Dhuhr'**
  String get dhuhr;

  /// No description provided for @asr.
  ///
  /// In en, this message translates to:
  /// **'Asr'**
  String get asr;

  /// No description provided for @maghrib.
  ///
  /// In en, this message translates to:
  /// **'Maghrib'**
  String get maghrib;

  /// No description provided for @isha.
  ///
  /// In en, this message translates to:
  /// **'Isha'**
  String get isha;

  /// No description provided for @awabin.
  ///
  /// In en, this message translates to:
  /// **'Awabin'**
  String get awabin;

  /// No description provided for @tahajjud.
  ///
  /// In en, this message translates to:
  /// **'Tahajjud'**
  String get tahajjud;

  /// No description provided for @afterIsha.
  ///
  /// In en, this message translates to:
  /// **'After Isha'**
  String get afterIsha;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @bangla.
  ///
  /// In en, this message translates to:
  /// **'Bangla'**
  String get bangla;

  /// No description provided for @finnish.
  ///
  /// In en, this message translates to:
  /// **'Finnish'**
  String get finnish;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'schedule'**
  String get schedule;

  /// No description provided for @maslaMasail.
  ///
  /// In en, this message translates to:
  /// **'Masala - Masael'**
  String get maslaMasail;

  /// No description provided for @calendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar;

  /// No description provided for @ramadanMubarak.
  ///
  /// In en, this message translates to:
  /// **'Ramadan Mubarak'**
  String get ramadanMubarak;

  /// No description provided for @nextPrayer.
  ///
  /// In en, this message translates to:
  /// **'last prayer'**
  String get nextPrayer;

  /// No description provided for @sehriTime.
  ///
  /// In en, this message translates to:
  /// **'Sehri time'**
  String get sehriTime;

  /// No description provided for @ifterTime.
  ///
  /// In en, this message translates to:
  /// **'Iftar time'**
  String get ifterTime;

  /// No description provided for @remaining.
  ///
  /// In en, this message translates to:
  /// **'Time remaining'**
  String get remaining;

  /// No description provided for @ofIfter.
  ///
  /// In en, this message translates to:
  /// **'of Iftar'**
  String get ofIfter;

  /// No description provided for @ofSehri.
  ///
  /// In en, this message translates to:
  /// **'of Sehri'**
  String get ofSehri;

  /// No description provided for @nextDay.
  ///
  /// In en, this message translates to:
  /// **'Next day\'s'**
  String get nextDay;

  /// No description provided for @sehri.
  ///
  /// In en, this message translates to:
  /// **'Sehri'**
  String get sehri;

  /// No description provided for @sehriDua.
  ///
  /// In en, this message translates to:
  /// **'Sehri\'s Dua'**
  String get sehriDua;

  /// No description provided for @ifter.
  ///
  /// In en, this message translates to:
  /// **'Iftar'**
  String get ifter;

  /// No description provided for @ifterDua.
  ///
  /// In en, this message translates to:
  /// **'Iftar\'s Dua'**
  String get ifterDua;

  /// No description provided for @changeAppLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change the language'**
  String get changeAppLanguage;

  /// No description provided for @changeAppLocation.
  ///
  /// In en, this message translates to:
  /// **'Change location'**
  String get changeAppLocation;

  /// No description provided for @shareApp.
  ///
  /// In en, this message translates to:
  /// **'Share the app'**
  String get shareApp;

  /// No description provided for @rateThisApp.
  ///
  /// In en, this message translates to:
  /// **'Rate this app'**
  String get rateThisApp;

  /// No description provided for @chooseYourLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select your language'**
  String get chooseYourLanguage;

  /// No description provided for @chooseYourLocation.
  ///
  /// In en, this message translates to:
  /// **'Select your location'**
  String get chooseYourLocation;

  /// No description provided for @hijriDate.
  ///
  /// In en, this message translates to:
  /// **'Hijri date'**
  String get hijriDate;

  /// No description provided for @prayer.
  ///
  /// In en, this message translates to:
  /// **'Prayer'**
  String get prayer;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @timeRemaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining Time'**
  String get timeRemaining;

  /// A message of greetings to user
  ///
  /// In en, this message translates to:
  /// **'Welcome {userName}'**
  String greetings(String userName);

  /// Formatted Time
  ///
  /// In en, this message translates to:
  /// **'{date}'**
  String formattedTime(DateTime date);

  /// No description provided for @arabicDate.
  ///
  /// In en, this message translates to:
  /// **'{day} {month, select, 1{Muharram} 2{Safar} 3{Rabiul Awwal} 4{Rabiul Thani} 5{Jumada Al-Awwal} 6{Jumada Al-Thani} 7{Rajab} 8{Sha’ban} 9{Ramadan} 10{Shawwal} 11{Dhul Qadah} 12{Dhul Hijjah} other{}}'**
  String arabicDate(String day, String month, String year);

  /// No description provided for @prayerName.
  ///
  /// In en, this message translates to:
  /// **'{name, select, Fajr{Fajr} Sunrise{Sunrise} Dhuhr{Dhuhr} Asr{Asr} Sunset{Sunset} Maghrib{Maghrib} Isha{Isha} FajrNext{Fajr} other{Fajr}}, '**
  String prayerName(String name);

  /// No description provided for @prayerTimeConvention.
  ///
  /// In en, this message translates to:
  /// **'Prayer Time Convention'**
  String get prayerTimeConvention;

  /// No description provided for @customAngles.
  ///
  /// In en, this message translates to:
  /// **'Custom Angle'**
  String get customAngles;

  /// No description provided for @fajrAngle.
  ///
  /// In en, this message translates to:
  /// **'Fajr Angle'**
  String get fajrAngle;

  /// No description provided for @ishaAngle.
  ///
  /// In en, this message translates to:
  /// **'Isha Angle'**
  String get ishaAngle;

  /// No description provided for @ishaInterval.
  ///
  /// In en, this message translates to:
  /// **'Isha Interval'**
  String get ishaInterval;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get minutes;

  /// No description provided for @maghribAngle.
  ///
  /// In en, this message translates to:
  /// **'Maghrib Angle'**
  String get maghribAngle;

  /// No description provided for @selectFajrAngle.
  ///
  /// In en, this message translates to:
  /// **'Select Fajr Angle:'**
  String get selectFajrAngle;

  /// No description provided for @selectIshaAngle.
  ///
  /// In en, this message translates to:
  /// **'Select Isha Angle:'**
  String get selectIshaAngle;

  /// No description provided for @showImsakInPrayerTimesPage.
  ///
  /// In en, this message translates to:
  /// **'Show Imsak in Prayer Times page'**
  String get showImsakInPrayerTimesPage;

  /// No description provided for @manualCorrection.
  ///
  /// In en, this message translates to:
  /// **'Manual Corrections'**
  String get manualCorrection;

  /// No description provided for @minute.
  ///
  /// In en, this message translates to:
  /// **'minute'**
  String get minute;

  /// No description provided for @selectedTime.
  ///
  /// In en, this message translates to:
  /// **'Selected Time'**
  String get selectedTime;

  /// No description provided for @sunRise.
  ///
  /// In en, this message translates to:
  /// **'Sun Rise'**
  String get sunRise;

  /// No description provided for @resetTime.
  ///
  /// In en, this message translates to:
  /// **'Reset Time'**
  String get resetTime;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @playAyah.
  ///
  /// In en, this message translates to:
  /// **'Play Ayah'**
  String get playAyah;

  /// No description provided for @playSurah.
  ///
  /// In en, this message translates to:
  /// **'Play Surah'**
  String get playSurah;

  /// No description provided for @onInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Please turn on internet'**
  String get onInternetConnection;

  /// No description provided for @translation.
  ///
  /// In en, this message translates to:
  /// **'Translation'**
  String get translation;

  /// No description provided for @transliteration.
  ///
  /// In en, this message translates to:
  /// **'Transliteration'**
  String get transliteration;

  /// No description provided for @revealedIn.
  ///
  /// In en, this message translates to:
  /// **'Revealed in'**
  String get revealedIn;

  /// No description provided for @nowPlaying.
  ///
  /// In en, this message translates to:
  /// **'Now Playing'**
  String get nowPlaying;

  /// No description provided for @ayah.
  ///
  /// In en, this message translates to:
  /// **'Ayah'**
  String get ayah;

  /// No description provided for @makkah.
  ///
  /// In en, this message translates to:
  /// **'Makkah'**
  String get makkah;

  /// No description provided for @madinah.
  ///
  /// In en, this message translates to:
  /// **'Madinah'**
  String get madinah;

  /// No description provided for @searchSurah.
  ///
  /// In en, this message translates to:
  /// **'Search Surah...'**
  String get searchSurah;

  /// No description provided for @imsak.
  ///
  /// In en, this message translates to:
  /// **'Imsak'**
  String get imsak;

  /// No description provided for @autoDetectLocation.
  ///
  /// In en, this message translates to:
  /// **'Auto-detect Location'**
  String get autoDetectLocation;

  /// No description provided for @prayerTimeCalculation.
  ///
  /// In en, this message translates to:
  /// **'Prayer Time Calculation'**
  String get prayerTimeCalculation;

  /// No description provided for @minutesBeforeFajr.
  ///
  /// In en, this message translates to:
  /// **'minutes before Fajr'**
  String get minutesBeforeFajr;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['bn', 'en', 'fi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn': return AppLocalizationsBn();
    case 'en': return AppLocalizationsEn();
    case 'fi': return AppLocalizationsFi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
