import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable()
class Pagination extends Equatable {
  final int? count;
  final int? limit;
  final int? offset;

  const Pagination({this.count, this.limit, this.offset});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return _$PaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaginationToJson(this);

  Pagination copyWith({
    int? count,
    int? limit,
    int? offset,
  }) {
    return Pagination(
      count: count ?? this.count,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [count, limit, offset];
}
