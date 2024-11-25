import 'dart:convert';

class CountryResponse {
  final List<Country>? countries;

 const CountryResponse({
    this.countries,
  });

  CountryResponse copyWith({
    List<Country>? countries,
  }) =>
      CountryResponse(
        countries: countries ?? this.countries,
      );

  factory CountryResponse.fromRawJson(String str) => CountryResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CountryResponse.fromJson(Map<String, dynamic> json) => CountryResponse(
    countries: json["countries"] == null ? [] : List<Country>.from(json["countries"]!.map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "countries": countries == null ? [] : List<dynamic>.from(countries!.map((x) => x.toJson())),
  };
}

class Country {
  final String? countryCode;
  final String? name;
  final String? nativeName;
  final String? currencySymbol;
  final String? capitalCity;
  final double? lat;
  final double? long;
  final int? firstDayOfWeek;

  const Country({
    this.countryCode,
    this.name,
    this.nativeName,
    this.currencySymbol,
    this.capitalCity,
    this.lat,
    this.long,
    this.firstDayOfWeek,
  });

  Country copyWith({
    String? countryCode,
    String? name,
    String? nativeName,
    String? currencySymbol,
    String? capitalCity,
    double? lat,
    double? long,
    int? firstDayOfWeek,
  }) =>
      Country(
        countryCode: countryCode ?? this.countryCode,
        name: name ?? this.name,
        nativeName: nativeName ?? this.nativeName,
        currencySymbol: currencySymbol ?? this.currencySymbol,
        capitalCity: capitalCity ?? this.capitalCity,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        firstDayOfWeek: firstDayOfWeek ?? this.firstDayOfWeek,
      );

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    countryCode: json["countryCode"],
    name: json["name"],
    nativeName: json["nativeName"],
    currencySymbol: json["currencySymbol"],
    capitalCity: json["capitalCity"],
    lat: json["lat"]?.toDouble(),
    long: json["long"]?.toDouble(),
    firstDayOfWeek: json["firstDayOfWeek"],
  );

  Map<String, dynamic> toJson() => {
    "countryCode": countryCode,
    "name": name,
    "nativeName": nativeName,
    "currencySymbol": currencySymbol,
    "capitalCity": capitalCity,
    "lat": lat,
    "long": long,
    "firstDayOfWeek": firstDayOfWeek,
  };
}
