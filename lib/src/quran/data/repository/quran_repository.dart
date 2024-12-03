// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:ramadantimes/src/quran/data/model/quran_model.dart';

class QuranRepository {
  final String apiUrl = 'http://api.alquran.cloud/v1/quran';

  // Future<QuranResponse> fetchQuranResponse() async {
  //   try {
  //     final response = await http.get(Uri.parse(apiUrl));

  //     if (response.statusCode == 200) {
  //       return QuranResponse.fromJson(json.decode(response.body));
  //     } else {
  //       throw Exception('Failed to load Quran data');
  //     }
  //   } catch (e) {
  //     throw Exception('Error fetching Quran data: $e');
  //   }
  // }

  // Future<QuranResponse> fetchQuranResponseTemp() async {
  //   return QuranResponse(
  //     status: 'Ok',
  //     code: 200,
  //     data: QuranModel(
  //       edition: Edition(
  //         englishName: '',
  //         format: '',
  //         identifier: '',
  //         language: '',
  //         name: '',
  //         type: '',
  //       ),
  //       surahs: [
  //         Surah(
  //           englishName: 'Al-Faatiha',
  //           englishNameTranslation: 'The Opening',
  //           name: "سُورَةُ ٱلْفَاتِحَةِ",
  //           number: 1,
  //           revelationType: 'Meccan',
  //           ayahs: [
  //             Ayah(
  //               text: "﻿بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
  //               hizbQuarter: 1,
  //               juz: 1,
  //               manzil: 1,
  //               number: 1,
  //               numberInSurah: 1,
  //               page: 1,
  //               ruku: 1,
  //               sajda: false,
  //             ),
  //             Ayah(
  //               text: "ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَٰلَمِينَ",
  //               hizbQuarter: 1,
  //               juz: 1,
  //               manzil: 1,
  //               number: 2,
  //               numberInSurah: 2,
  //               page: 1,
  //               ruku: 1,
  //               sajda: false,
  //             ),
  //           ],
  //         ),
  //         Surah(
  //           englishName: "Al-Baqara",
  //           englishNameTranslation: "The Cow",
  //           name: "سُورَةُ البَقَرَةِ",
  //           number: 2,
  //           revelationType: 'Medinan',
  //           ayahs: [
  //             Ayah(
  //               text: "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ الٓمٓ",
  //               hizbQuarter: 1,
  //               juz: 1,
  //               manzil: 1,
  //               number: 8,
  //               numberInSurah: 1,
  //               page: 2,
  //               ruku: 2,
  //               sajda: false,
  //             ),
  //             Ayah(
  //               text: "ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَٰلَمِينَ",
  //               hizbQuarter: 1,
  //               juz: 1,
  //               manzil: 1,
  //               number: 9,
  //               numberInSurah: 2,
  //               page: 2,
  //               ruku: 2,
  //               sajda: false,
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
