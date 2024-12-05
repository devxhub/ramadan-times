import 'package:flutter/cupertino.dart';

import '../../l10n/app_localizations.dart';

String engToBn(String input, BuildContext context) {
  const english = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'weeks',
    'week',
    'days',
    'day',
    'months',
    'month',
    'years',
    'year',
    'hijri',
  ];
  const farsi = [
    '০',
    '১',
    '২',
    '৩',
    '৪',
    '৫',
    '৬',
    '৭',
    '৮',
    '৯',
    'সপ্তাহ',
    'সপ্তাহ',
    'দিন',
    'দিন',
    'মাস',
    'মাস',
    'বছর',
    'বছর',
    'হিজরি',
  ];
  const finnish = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'viikko',
    'viikko',
    'päivä',
    'päivä',
    'kuukausi',
    'kuukausi',
    'vuosi',
    'vuosi',
    'hijri',
  ];

  for (int i = 0; i < english.length; i++) {
    if (AppLocalizations.of(context)!.localeName == "bn") {
      input = input.replaceAll(english[i], farsi[i]);
    } else if (AppLocalizations.of(context)!.localeName == "fi") {
      input = input.replaceAll(english[i], finnish[i]);
    }
  }

  return input;
}

String hijriMonthLocal(String input, BuildContext context) {
  const monthNamesEnglish = [
    'Muharram',
    'Safar',
    'Rabi\' Al-Awwal',
    'Rabi\' Al-Thani',
    'Jumada Al-Awwal',
    'Jumada Al-Thani',
    'Rajab',
    'Sha\'aban',
    'Ramadan',
    'Shawwal',
    'Dhu Al-Qi\'dah',
    'Dhu Al-Hijjah'
  ];

  const monthNamesBangla = [
    'মুহাররাম',
    'সফর',
    'রবিউল আউয়াল',
    'রবিউস সানি',
    'জুমাদাল আউয়াল',
    'জুমাদাল সানি',
    'রজব',
    'শা\'বান',
    'রমজান',
    'শাওয়াল',
    'যুল-ক্বা\'দাহ',
    'যুল-হিজ্জাহ'
  ];

  const monthNamesFinnish = [
    'Muharram',
    'Safar',
    'Rabi\' Al-Awwal',
    'Rabi\' Al-Thani',
    'Jumada Al-Awwal',
    'Jumada Al-Thani',
    'Rajab',
    'Sha\'aban',
    'Ramadan',
    'Shawwal',
    'Dhu Al-Qi\'dah',
    'Dhu Al-Hijjah'
  ];

  for (int i = 0; i < monthNamesEnglish.length; i++) {
    if (AppLocalizations.of(context)!.localeName == "bn") {
      input = input.replaceAll(monthNamesEnglish[i], monthNamesBangla[i]);
    } else if (AppLocalizations.of(context)!.localeName == "fi") {
      input = input.replaceAll(monthNamesEnglish[i], monthNamesFinnish[i]);
    }
  }

  return input;
}
