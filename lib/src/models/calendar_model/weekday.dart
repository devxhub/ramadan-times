import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weekday.g.dart';

@JsonSerializable()
class Weekday extends Equatable {
  final String? en;

  const Weekday({this.en});

  factory Weekday.fromJson(Map<String, dynamic> json) {
    return _$WeekdayFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeekdayToJson(this);

  Weekday copyWith({
    String? en,
  }) {
    return Weekday(
      en: en ?? this.en,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [en];
}
