// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarModel _$CalendarModelFromJson(Map<String, dynamic> json) =>
    CalendarModel(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CalendarModelToJson(CalendarModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };
