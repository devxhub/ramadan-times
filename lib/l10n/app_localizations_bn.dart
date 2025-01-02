import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get prohibitedPrayerTimes => 'নামাজের নিষিদ্ধ সময়';

  @override
  String get morning => 'সকাল';

  @override
  String get noon => 'দুপুর';

  @override
  String get evening => 'সন্ধ্যা';

  @override
  String get month => 'মাস';

  @override
  String get twoWeek => '২ সপ্তাহ';

  @override
  String get week => 'সপ্তাহ';

  @override
  String get locationSettings => 'লোকেশন সেটিংস';

  @override
  String get selectYourCountry => 'আপনার দেশ নির্বাচন করুন';

  @override
  String get selectCountry => 'দেশ নির্বাচন করুন';

  @override
  String get selectYourCity => 'আপনার শহর নির্বাচন করুন';

  @override
  String get selectACity => 'শহর নির্বাচন করুন';

  @override
  String get selectYourDistrict => 'Select Your District';

  @override
  String get pleaseSelectYourCity => 'শহর নির্বাচন করুন';

  @override
  String get save => 'সেভ';

  @override
  String get quran => 'কুরআন';

  @override
  String get prayerTimes => 'নামাজের সময়সূচী';

  @override
  String get fajr => 'ফজর';

  @override
  String get dhuhr => 'যুহর';

  @override
  String get asr => 'আসর';

  @override
  String get maghrib => 'মাগরিব';

  @override
  String get isha => 'ইশা';

  @override
  String get awabin => 'আওয়াবিন';

  @override
  String get tahajjud => 'তাহাজ্জুদ';

  @override
  String get afterIsha => 'ইশার পরে';

  @override
  String get english => 'ইংরেজি';

  @override
  String get bangla => 'বাংলা';

  @override
  String get finnish => 'ফিনিশ';

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
        'FajrNext': 'ফজর',
        'other': 'ফজর',
      },
    );
    return '$_temp0 ';
  }

  @override
  String get prayerTimeConvention => 'নামাজের সময় সম্মেলন';

  @override
  String get customAngles => 'কাস্টম কোণ';

  @override
  String get fajrAngle => 'ফজর কোণ';

  @override
  String get ishaAngle => 'ইশা কোণ';

  @override
  String get ishaInterval => 'ইশার ব্যবধান';

  @override
  String get minutes => 'মিনিট';

  @override
  String get maghribAngle => 'মাগরিব কোণ';

  @override
  String get selectFajrAngle => 'ফজর কোণ নির্বাচন করুন:';

  @override
  String get selectIshaAngle => 'ইশা কোণ নির্বাচন করুন:';

  @override
  String get showImsakInPrayerTimesPage => 'নামাজের সময়সূচি পৃষ্ঠায় ইমসাক প্রদর্শন করুন';

  @override
  String get manualCorrection => 'ম্যানুয়াল সংশোধন';

  @override
  String get minute => 'মিনিট';

  @override
  String get selectedTime => 'নির্বাচিত সময়';

  @override
  String get sunRise => 'সূর্যোদয়';

  @override
  String get resetTime => 'সময় রিসেট করুন';

  @override
  String get done => 'সম্পন্ন';

  @override
  String get cancel => 'বাতিল';

  @override
  String get playAyah => 'আয়াত চালান';

  @override
  String get playSurah => 'সূরা চালান';

  @override
  String get onInternetConnection => 'ইন্টারনেট সংযোগ নেই। দয়া করে ইন্টারনেট চালু করুন';

  @override
  String get translation => 'অনুবাদ';

  @override
  String get transliteration => 'উচ্চারণ';

  @override
  String get revealedIn => 'প্রকাশিত হয়েছে';

  @override
  String get nowPlaying => 'এখন চলছে';

  @override
  String get ayah => 'আয়াত';

  @override
  String get makkah => 'মক্কা';

  @override
  String get madinah => 'মদিনা';

  @override
  String get searchSurah => 'সূরা খুঁজুন...';

  @override
  String get imsak => 'ইমসাক';

  @override
  String get autoDetectLocation => 'অবস্থান স্বয়ংক্রিয় সনাক্তকরণ';

  @override
  String get prayerTimeCalculation => 'নামাজের সময় গণনা';

  @override
  String get minutesBeforeFajr => 'ফজরের আগে মিনিট';

  @override
  String get settings => 'সেটিংস';

  @override
  String get selectUserLocation => 'ব্যবহারকারীর অবস্থান নির্বাচন করুন';

  @override
  String get noResultsFound => 'কোন ফলাফল পাওয়া যায়নি';

  @override
  String get selectACountry => 'একটি দেশ নির্বাচন করুন';

  @override
  String get pleaseSelectACity => 'অনুগ্রহ করে একটি শহর নির্বাচন করুন';

  @override
  String get countrySavedSuccessfully => 'দেশ সফলভাবে সংরক্ষণ করা হয়েছে!';

  @override
  String get countryIsNotFoundInTheList => 'তালিকায় দেশটি পাওয়া যায়নি!';

  @override
  String get passwordMustBeAtLeast8Characters => 'পাসওয়ার্ড ন্যূনতম ৮ অক্ষরের হতে হবে।';

  @override
  String get pleaseEnterYourEmailAddress => 'দয়া করে,আপনার ইমেল লিখুন';

  @override
  String get pleaseEnterYourPassword => 'অনুগ্রহ করে আপনার পাসওয়ার্ড লিখুন';

  @override
  String get signUpTitle => 'নিবন্ধন করুন';

  @override
  String get gettingStarted => 'শুরু করুন';

  @override
  String get createAccount => 'চালিয়ে যেতে একটি অ্যাকাউন্ট তৈরি করুন!';

  @override
  String get nameLabel => 'নাম';

  @override
  String get nameHint => 'আপনার নাম লিখুন';

  @override
  String get emailLabel => 'আপনার ইমেল';

  @override
  String get emailHint => 'আপনার ইমেল লিখুন';

  @override
  String get passwordLabel => 'পাসওয়ার্ড';

  @override
  String get passwordHint => 'আপনার পাসওয়ার্ড লিখুন';

  @override
  String get confirmPasswordLabel => 'পাসওয়ার্ড নিশ্চিত করুন';

  @override
  String get confirmPasswordHint => 'আপনার নিশ্চিত পাসওয়ার্ড লিখুন';

  @override
  String get signUpButton => 'নিবন্ধন করুন';

  @override
  String get alreadyHaveAccount => 'ইতিমধ্যে একটি অ্যাকাউন্ট আছে?';

  @override
  String get signIn => 'সাইন ইন করুন';

  @override
  String get pleaseEnterYourEmail => 'অনুগ্রহ করে আপনার ইমেল ঠিকানা লিখুন';

  @override
  String get passwordTooShort => 'পাসওয়ার্ড কমপক্ষে ৮ অক্ষরের হতে হবে';

  @override
  String get confirmPasswordError => 'পাসওয়ার্ড নিশ্চিত পাসওয়ার্ডের সাথে মেলে না';

  @override
  String get pleaseEnterAValidEmailAddress => 'একটি বৈধ ইমেল ঠিকানা লিখুন';

  @override
  String get pleaseEnterYourConfirmPassword => 'অনুগ্রহ করে আপনার কনফার্ম পাসওয়ার্ড লিখুন';
}
