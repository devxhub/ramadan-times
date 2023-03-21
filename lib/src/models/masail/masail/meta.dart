import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pagination.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta extends Equatable {
  final Pagination? pagination;

  const Meta({this.pagination});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);

  Meta copyWith({
    Pagination? pagination,
  }) {
    return Meta(
      pagination: pagination ?? this.pagination,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [pagination];
}
