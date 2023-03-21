// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) => District(
      name: json['name'] as String,
      id: json['id'] as String,
      bn_name: json['bn_name'] as String,
      url: json['url'] as String,
      division_id: json['division_id'] as String,
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
    );

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'id': instance.id,
      'division_id': instance.division_id,
      'name': instance.name,
      'bn_name': instance.bn_name,
      'url': instance.url,
      'lat': instance.lat,
      'lon': instance.lon,
    };
