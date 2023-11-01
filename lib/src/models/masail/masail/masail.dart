import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'links.dart';
import 'meta.dart';
import 'result.dart';

part 'masail.g.dart';

@JsonSerializable()
class Masail extends Equatable {
  final List<Result>? results;
  final Meta? meta;
  final Links? links;

  const Masail({this.results, this.meta, this.links});

  factory Masail.fromJson(Map<String, dynamic> json) {
    return _$MasailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MasailToJson(this);
  Map<String, dynamic> toMap() => {

    'results': json.encode(results!.map((e) => e.toJson()).toList()),
    'meta': json.encode(meta!.toJson()),
    'links': json.encode(links!.toJson())
      };

  Masail copyWith({
    List<Result>? results,
    Meta? meta,
    Links? links,
  }) {
    return Masail(
      results: results ?? this.results,
      meta: meta ?? this.meta,
      links: links ?? this.links,
    );
  }

  factory Masail.fromMap(Map<String, dynamic> sMasala) => Masail(
    results: List<Result>.from(
        json.decode(sMasala['results']).map((x) => Result.fromJson(x))),
    meta: Meta.fromJson(json.decode(sMasala['meta'])),
    links: Links.fromJson(json.decode(sMasala['links'])),

  );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [results, meta, links];
}
