class QuranModel {
  final int surahNumber;
  final int surahAyahNumber;
  final String surahName;
  final String? surahArabicName;
  final String? surahSpanishName;
  final String? surahSwedishName;
  final String? surahChineseName;
  final String? surahPersianName;
  final String? surahIndonesianName;
  final String? surahPortugueseName;
  final String? surahMalayalamName;
  final String? surahUrduName;
  final String? surahBengaliName;

  QuranModel({
    required this.surahNumber,
    required this.surahAyahNumber,
    required this.surahName,
    this.surahArabicName,
    this.surahSpanishName,
    this.surahSwedishName,
    this.surahChineseName,
    this.surahPersianName,
    this.surahIndonesianName,
    this.surahPortugueseName,
    this.surahMalayalamName,
    this.surahUrduName,
    this.surahBengaliName,
  });
}
