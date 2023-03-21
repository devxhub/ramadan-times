import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ramadantimes/src/models/calendar_model/datum.dart';

part 'timing.g.dart';

@JsonSerializable()
class Timing extends Equatable {
  final int? code;
  final String? status;
  final Datum? data;

  const Timing({this.code, this.status, this.data});

  factory Timing.fromJson(Map<String, dynamic> json) {
    return _$TimingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TimingToJson(this);

  Timing copyWith({
    int? code,
    String? status,
    Datum? data,
  }) {
    return Timing(
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
