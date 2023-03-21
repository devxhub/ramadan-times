// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timing _$TimingFromJson(Map<String, dynamic> json) => Timing(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Datum.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TimingToJson(Timing instance) => <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };
