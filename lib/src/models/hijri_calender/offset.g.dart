// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offset _$OffsetFromJson(Map<String, dynamic> json) => Offset(
      imsak: (json['Imsak'] as num?)?.toInt(),
      fajr: (json['Fajr'] as num?)?.toInt(),
      sunrise: (json['Sunrise'] as num?)?.toInt(),
      dhuhr: (json['Dhuhr'] as num?)?.toInt(),
      asr: (json['Asr'] as num?)?.toInt(),
      maghrib: (json['Maghrib'] as num?)?.toInt(),
      sunset: (json['Sunset'] as num?)?.toInt(),
      isha: (json['Isha'] as num?)?.toInt(),
      midnight: (json['Midnight'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OffsetToJson(Offset instance) => <String, dynamic>{
      'Imsak': instance.imsak,
      'Fajr': instance.fajr,
      'Sunrise': instance.sunrise,
      'Dhuhr': instance.dhuhr,
      'Asr': instance.asr,
      'Maghrib': instance.maghrib,
      'Sunset': instance.sunset,
      'Isha': instance.isha,
      'Midnight': instance.midnight,
    };
