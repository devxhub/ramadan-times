import 'dart:convert';

class QuranResponse {
  final int? code;
  final String? status;
  final QuranModel? data;

  QuranResponse({
    this.code,
    this.status,
    this.data,
  });

  QuranResponse copyWith({
    int? code,
    String? status,
    QuranModel? data,
  }) =>
      QuranResponse(
        code: code ?? this.code,
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory QuranResponse.fromRawJson(String str) =>
      QuranResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuranResponse.fromJson(Map<String, dynamic> json) => QuranResponse(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null ? null : QuranModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data?.toJson(),
      };
}

class QuranModel {
  final List<Surah>? surahs;
  final Edition? edition;

  QuranModel({
    this.surahs,
    this.edition,
  });

  QuranModel copyWith({
    List<Surah>? surahs,
    Edition? edition,
  }) =>
      QuranModel(
        surahs: surahs ?? this.surahs,
        edition: edition ?? this.edition,
      );

  factory QuranModel.fromRawJson(String str) =>
      QuranModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuranModel.fromJson(Map<String, dynamic> json) => QuranModel(
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
  final String? identifier;
  final String? language;
  final String? name;
  final String? englishName;
  final String? format;
  final String? type;

  Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
  });

  Edition copyWith({
    String? identifier,
    String? language,
    String? name,
    String? englishName,
    String? format,
    String? type,
  }) =>
      Edition(
        identifier: identifier ?? this.identifier,
        language: language ?? this.language,
        name: name ?? this.name,
        englishName: englishName ?? this.englishName,
        format: format ?? this.format,
        type: type ?? this.type,
      );

  factory Edition.fromRawJson(String str) => Edition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final String? revelationType;
  final List<Ayah>? ayahs;

  Surah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  Surah copyWith({
    int? number,
    String? name,
    String? englishName,
    String? englishNameTranslation,
    String? revelationType,
    List<Ayah>? ayahs,
  }) =>
      Surah(
        number: number ?? this.number,
        name: name ?? this.name,
        englishName: englishName ?? this.englishName,
        englishNameTranslation:
            englishNameTranslation ?? this.englishNameTranslation,
        revelationType: revelationType ?? this.revelationType,
        ayahs: ayahs ?? this.ayahs,
      );

  factory Surah.fromRawJson(String str) => Surah.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        revelationType: json["revelationType"],
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
  final int? number;
  final String? text;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;
  final bool? sajda;

  Ayah({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  Ayah copyWith({
    int? number,
    String? text,
    int? numberInSurah,
    int? juz,
    int? manzil,
    int? page,
    int? ruku,
    int? hizbQuarter,
    bool? sajda,
  }) =>
      Ayah(
        number: number ?? this.number,
        text: text ?? this.text,
        numberInSurah: numberInSurah ?? this.numberInSurah,
        juz: juz ?? this.juz,
        manzil: manzil ?? this.manzil,
        page: page ?? this.page,
        ruku: ruku ?? this.ruku,
        hizbQuarter: hizbQuarter ?? this.hizbQuarter,
        sajda: sajda ?? this.sajda,
      );

  factory Ayah.fromRawJson(String str) => Ayah.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json["number"],
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
