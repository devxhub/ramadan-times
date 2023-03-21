// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Date _$DateFromJson(Map<String, dynamic> json) => Date(
      readable: json['readable'] as String?,
      timestamp: json['timestamp'] as String?,
      gregorian: json['gregorian'] == null
          ? null
          : Gregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
      hijri: json['hijri'] == null
          ? null
          : Hijri.fromJson(json['hijri'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
      'readable': instance.readable,
      'timestamp': instance.timestamp,
      'gregorian': instance.gregorian,
      'hijri': instance.hijri,
    };
