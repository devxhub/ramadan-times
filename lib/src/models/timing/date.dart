import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'gregorian.dart';
import 'hijri.dart';

part 'date.g.dart';

@JsonSerializable()
class Date extends Equatable {
  final String? readable;
  final String? timestamp;
  final Gregorian? gregorian;
  final Hijri? hijri;

  const Date({this.readable, this.timestamp, this.gregorian, this.hijri});

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

  Map<String, dynamic> toJson() => _$DateToJson(this);

  Date copyWith({
    String? readable,
    String? timestamp,
    Gregorian? gregorian,
    Hijri? hijri,
  }) {
    return Date(
      readable: readable ?? this.readable,
      timestamp: timestamp ?? this.timestamp,
      gregorian: gregorian ?? this.gregorian,
      hijri: hijri ?? this.hijri,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [readable, timestamp, gregorian, hijri];
}
