import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

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
    Locale('en')
  ];

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'সময়সূচী'**
  String get schedule;

  /// No description provided for @maslaMasail.
  ///
  /// In en, this message translates to:
  /// **'মাসআলা- মাসায়েল'**
  String get maslaMasail;

  /// No description provided for @calendar.
  ///
  /// In en, this message translates to:
  /// **'ক্যালেন্ডার'**
  String get calendar;

  /// No description provided for @ramadanMubarak.
  ///
  /// In en, this message translates to:
  /// **'রমজান মুবারক'**
  String get ramadanMubarak;

  /// No description provided for @nextPrayer.
  ///
  /// In en, this message translates to:
  /// **'পরবতী নামাজ'**
  String get nextPrayer;

  /// No description provided for @sehriTime.
  ///
  /// In en, this message translates to:
  /// **'সেহরির সময়'**
  String get sehriTime;

  /// No description provided for @ifterTime.
  ///
  /// In en, this message translates to:
  /// **'ইফতারের সময়'**
  String get ifterTime;

  /// No description provided for @remaining.
  ///
  /// In en, this message translates to:
  /// **'সময় বাকি'**
  String get remaining;

  /// No description provided for @ofIfter.
  ///
  /// In en, this message translates to:
  /// **'ইফতারের'**
  String get ofIfter;

  /// No description provided for @ofSehri.
  ///
  /// In en, this message translates to:
  /// **'সেহরির'**
  String get ofSehri;

  /// No description provided for @nextDay.
  ///
  /// In en, this message translates to:
  /// **'পরবর্তী দিনের'**
  String get nextDay;

  /// No description provided for @sehri.
  ///
  /// In en, this message translates to:
  /// **'সেহরি'**
  String get sehri;

  /// No description provided for @sehriDua.
  ///
  /// In en, this message translates to:
  /// **'সেহরির দোয়া'**
  String get sehriDua;

  /// No description provided for @ifter.
  ///
  /// In en, this message translates to:
  /// **'ইফতার'**
  String get ifter;

  /// No description provided for @ifterDua.
  ///
  /// In en, this message translates to:
  /// **'ইফতারের দোয়া'**
  String get ifterDua;

  /// No description provided for @changeAppLanguage.
  ///
  /// In en, this message translates to:
  /// **'ভাষা পরিবর্তন করুন'**
  String get changeAppLanguage;

  /// No description provided for @changeAppLocation.
  ///
  /// In en, this message translates to:
  /// **'অবস্থান পরিবর্তন করুন'**
  String get changeAppLocation;

  /// No description provided for @shareApp.
  ///
  /// In en, this message translates to:
  /// **'শেয়ার করুন'**
  String get shareApp;

  /// No description provided for @rateThisApp.
  ///
  /// In en, this message translates to:
  /// **'রেটিং দিন'**
  String get rateThisApp;

  /// No description provided for @chooseYourLanguage.
  ///
  /// In en, this message translates to:
  /// **'আপনার ভাষা নির্বাচন করুন'**
  String get chooseYourLanguage;

  /// No description provided for @chooseYourLocation.
  ///
  /// In en, this message translates to:
  /// **'আপনার অবস্থান নির্বাচন করুন'**
  String get chooseYourLocation;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'সংরক্ষণ করুন'**
  String get save;

  /// No description provided for @hijriDate.
  ///
  /// In en, this message translates to:
  /// **'হিজরি তারিখ'**
  String get hijriDate;

  /// No description provided for @prayer.
  ///
  /// In en, this message translates to:
  /// **'নামায'**
  String get prayer;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'গোপনীয়তা নীতি'**
  String get privacyPolicy;

  /// No description provided for @timeRemaining.
  ///
  /// In en, this message translates to:
  /// **'সময় বাকি'**
  String get timeRemaining;

  /// A message of greetings to user
  ///
  /// In en, this message translates to:
  /// **'স্বাগতম {userName}'**
  String greetings(String userName);

  /// Formatted Time
  ///
  /// In en, this message translates to:
  /// **'{date}'**
  String formattedTime(DateTime date);

  /// No description provided for @arabicDate.
  ///
  /// In en, this message translates to:
  /// **'{day} {month}, {year} AH'**
  String arabicDate(String day, String month, String year);

  /// No description provided for @prayerName.
  ///
  /// In en, this message translates to:
  /// **'{name, select, Fajr{Fajar} Sunrise{Sunrise} Dhuhr{Dhuhor} Asr{Asor} Sunset{Sunset} Maghrib{Maghrib} Isha{Isha} other{name}}, '**
  String prayerName(String name);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn': return AppLocalizationsBn();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
