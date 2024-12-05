import 'dart:convert';

QuranTransliterationModel quranModelFromJson(String str) =>
    QuranTransliterationModel.fromJson(json.decode(str));

String quranModelToJson(QuranTransliterationModel data) =>
    json.encode(data.toJson());

class QuranTransliterationModel {
  int? code;
  String? status;
  SurahModel? data;

  QuranTransliterationModel({
    this.code,
    this.status,
    this.data,
  });

  factory QuranTransliterationModel.fromJson(Map<String, dynamic> json) =>
      QuranTransliterationModel(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null ? null : SurahModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data?.toJson(),
      };
}

class SurahModel {
  List<Surah>? surahs;
  Edition? edition;

  SurahModel({
    this.surahs,
    this.edition,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        surahs: json["surahs"] == null
            ? []
            : List<Surah>.from(json["surahs"]!.map((x) => Surah.fromJson(x))),
        edition:
            json["edition"] == null ? null : Edition.fromJson(json["edition"]),
      );

  Map<String, dynamic> toJson() => {
        "surahs": surahs == null
            ? []
            : List<dynamic>.from(surahs!.map((x) => x.toJson())),
        "edition": edition?.toJson(),
      };
}

class Edition {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;

  Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
  });

  factory Edition.fromJson(Map<String, dynamic> json) => Edition(
        identifier: json["identifier"],
        language: json["language"],
        name: json["name"],
        englishName: json["englishName"],
        format: json["format"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "language": language,
        "name": name,
        "englishName": englishName,
        "format": format,
        "type": type,
      };
}

class Surah {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  List<Ayah>? ayahs;

  Surah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        revelationType: json["revelationType"]!,
        ayahs: json["ayahs"] == null
            ? []
            : List<Ayah>.from(json["ayahs"]!.map((x) => Ayah.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "revelationType": revelationType,
        "ayahs": ayahs == null
            ? []
            : List<dynamic>.from(ayahs!.map((x) => x.toJson())),
      };
}

class Ayah {
  int? number;
  String? audio;
  List<String>? audioSecondary;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  dynamic sajda;

  Ayah({
    this.number,
    this.audio,
    this.audioSecondary,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json["number"],
        audio: json["audio"],
        audioSecondary: json["audioSecondary"] == null
            ? []
            : List<String>.from(json["audioSecondary"]!.map((x) => x)),
        text: json["text"],
        numberInSurah: json["numberInSurah"],
        juz: json["juz"],
        manzil: json["manzil"],
        page: json["page"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: json["sajda"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "audio": audio,
        "audioSecondary": audioSecondary == null
            ? []
            : List<dynamic>.from(audioSecondary!.map((x) => x)),
        "text": text,
        "numberInSurah": numberInSurah,
        "juz": juz,
        "manzil": manzil,
        "page": page,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda,
      };
}

class SajdaClass {
  int? id;
  bool? recommended;
  bool? obligatory;

  SajdaClass({
    this.id,
    this.recommended,
    this.obligatory,
  });

  factory SajdaClass.fromJson(Map<String, dynamic> json) => SajdaClass(
        id: json["id"],
        recommended: json["recommended"],
        obligatory: json["obligatory"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "recommended": recommended,
        "obligatory": obligatory,
      };
}
