// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Params _$ParamsFromJson(Map<String, dynamic> json) => Params(
      fajr: (json['Fajr'] as num?)?.toInt(),
      isha: (json['Isha'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ParamsToJson(Params instance) => <String, dynamic>{
      'Fajr': instance.fajr,
      'Isha': instance.isha,
    };
