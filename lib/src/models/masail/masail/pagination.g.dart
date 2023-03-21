// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      count: json['count'] as int?,
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'count': instance.count,
      'limit': instance.limit,
      'offset': instance.offset,
    };
