// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hijri_calender.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HijriCalender _$HijriCalenderFromJson(Map<String, dynamic> json) =>
    HijriCalender(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HijriCalenderToJson(HijriCalender instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };
