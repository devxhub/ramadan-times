import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'calendar_model.g.dart';

@JsonSerializable()
class CalendarModel extends Equatable {
  final int? code;
  final String? status;
  final List<Datum>? data;

  const CalendarModel({this.code, this.status, this.data});

  factory CalendarModel.fromJson(Map<String, dynamic> json) {
    return _$CalendarModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CalendarModelToJson(this);

  Map<String, dynamic> toMap() => {
    'code': code,
    'status': status,
    'data': json.encode(data!.map((e) => e.toJson()).toList()),
  };


  CalendarModel copyWith({
    int? code,
    String? status,
    List<Datum>? data,
  }) {
    return CalendarModel(
      code: code ?? this.code,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
  factory CalendarModel.fromMap(Map<String, dynamic> sCalendar) => CalendarModel(
    code: sCalendar['code'],
    status: sCalendar['status'],
    data:List<Datum>.from(
        json.decode(sCalendar['data']).map((x) => Datum.fromJson(x))),
  );


  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [code, status, data];
}
