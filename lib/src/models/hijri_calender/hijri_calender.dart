import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../calendar_model/datum.dart';
import 'datum.dart';

part 'hijri_calender.g.dart';

@JsonSerializable()
class HijriCalender extends Equatable {
  final int? code;
  final String? status;
  final List<Datum>? data;

  const HijriCalender({this.code, this.status, this.data});

  factory HijriCalender.fromJson(Map<String, dynamic> json) {
    return _$HijriCalenderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HijriCalenderToJson(this);

  HijriCalender copyWith({
    int? code,
    String? status,
    List<Datum>? data,
  }) {
    return HijriCalender(
      code: code ?? this.code,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [code, status, data];
}
