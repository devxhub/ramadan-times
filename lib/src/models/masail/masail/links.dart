import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable()
class Links extends Equatable {
  final String? first;
  final String? last;
  final dynamic next;
  final dynamic prev;

  const Links({this.first, this.last, this.next, this.prev});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);

  Links copyWith({
    String? first,
    String? last,
    dynamic next,
    dynamic prev,
  }) {
    return Links(
      first: first ?? this.first,
      last: last ?? this.last,
      next: next ?? this.next,
      prev: prev ?? this.prev,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [first, last, next, prev];
}
