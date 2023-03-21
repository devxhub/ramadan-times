// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'masail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Masail _$MasailFromJson(Map<String, dynamic> json) => Masail(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MasailToJson(Masail instance) => <String, dynamic>{
      'results': instance.results,
      'meta': instance.meta,
      'links': instance.links,
    };
