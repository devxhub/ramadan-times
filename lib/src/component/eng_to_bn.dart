String engToBn(String input) {
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

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], farsi[i]);
  }

  return input;
}
