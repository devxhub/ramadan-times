// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'timings.g.dart';

// @JsonSerializable()
// class Timings extends Equatable {
//   @JsonKey(name: 'Fajr')
//   final String? fajr;
//   @JsonKey(name: 'Sunrise')
//   final String? sunrise;
//   @JsonKey(name: 'Dhuhr')
//   final String? dhuhr;
//   @JsonKey(name: 'Asr')
//   final String? asr;
//   @JsonKey(name: 'Sunset')
//   final String? sunset;
//   @JsonKey(name: 'Maghrib')
//   final String? maghrib;
//   @JsonKey(name: 'Isha')
//   final String? isha;
//   @JsonKey(name: 'Imsak')
//   final String? imsak;
//   @JsonKey(name: 'Midnight')
//   final String? midnight;

//   const Timings({
//     this.fajr,
//     this.sunrise,
//     this.dhuhr,
//     this.asr,
//     this.sunset,
//     this.maghrib,
//     this.isha,
//     this.imsak,
//     this.midnight,
//   });

//   factory Timings.fromJson(Map<String, dynamic> json) {
//     return _$TimingsFromJson(json);
//   }

//   Map<String, dynamic> toJson() => _$TimingsToJson(this);

//   Timings copyWith({
//     String? fajr,
//     String? sunrise,
//     String? dhuhr,
//     String? asr,
//     String? sunset,
//     String? maghrib,
//     String? isha,
//     String? imsak,
//     String? midnight,
//   }) {
//     return Timings(
//       fajr: fajr ?? this.fajr,
//       sunrise: sunrise ?? this.sunrise,
//       dhuhr: dhuhr ?? this.dhuhr,
//       asr: asr ?? this.asr,
//       sunset: sunset ?? this.sunset,
//       maghrib: maghrib ?? this.maghrib,
//       isha: isha ?? this.isha,
//       imsak: imsak ?? this.imsak,
//       midnight: midnight ?? this.midnight,
//     );
//   }

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props {
//     return [
//       fajr,
//       sunrise,
//       dhuhr,
//       asr,
//       sunset,
//       maghrib,
//       isha,
//       imsak,
//       midnight,
//     ];
//   }
// }
