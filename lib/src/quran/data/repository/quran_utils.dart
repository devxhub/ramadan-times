import 'package:quran/quran.dart' as quran;
import 'package:muslimtimespro/src/quran/data/model/quran_transliteration_model.dart';
import 'package:muslimtimespro/src/quran/data/repository/quran_data_two.dart';
import 'quran_custom_surah_name.dart';

String getSurahName(int surahNumber, String languageCode) {
  switch (languageCode) {
    case "en":
      return getCustomSurahName(surahNumber, 'en');
    case "bn":
      return getCustomSurahName(surahNumber, languageCode);
    case "fr":
      return getCustomSurahName(surahNumber, 'en');
    case "pt":
      return getCustomSurahName(surahNumber, 'en');
    case "id":
      return getCustomSurahName(surahNumber, 'en');
    case "tr":
      return getCustomSurahName(surahNumber, languageCode);
    case "ml":
      return getCustomSurahName(surahNumber, languageCode);
    case "fa":
      return getCustomSurahName(surahNumber, languageCode);
    case "ch":
      return getCustomSurahName(surahNumber, languageCode);
    case "sw":
      return getCustomSurahName(surahNumber, 'en');
    case "es":
      return getCustomSurahName(surahNumber, 'en');
    case "ur":
      return getCustomSurahName(surahNumber, languageCode);
    default:
      return '';
  }
}

quran.Translation getSurahVerseTranslation(String languageCode) {
  switch (languageCode) {
    case "en":
      return quran.Translation.enClearQuran;
    case "bn":
      return quran.Translation.bengali;
    case "fr":
      return quran.Translation.frHamidullah;
    case "pt":
      return quran.Translation.portuguese;
    case "id":
      return quran.Translation.indonesian;
    case "tr":
      return quran.Translation.trSaheeh;
    case "ml":
      return quran.Translation.mlAbdulHameed;
    case "fa":
      return quran.Translation.faHusseinDari;
    case "ch":
      return quran.Translation.chinese;
    case "sw":
      return quran.Translation.swedish;
    case "es":
      return quran.Translation.spanish;
    case "ur":
      return quran.Translation.urdu;
    default:
      return quran.Translation.enClearQuran;
  }
}

String getVerseTransliteration(int surahNumber, int ayahNumber) {
  QuranTransliterationModel quranData =
      QuranTransliterationModel.fromJson(quranJson);

  for (var surah in quranData.data!.surahs!) {
    if (surah.number == surahNumber) {
      for (var ayah in surah.ayahs!) {
        if (ayah.numberInSurah == ayahNumber) {
          return ayah.text!;
        }
      }
    }
  }
  return '';
}
