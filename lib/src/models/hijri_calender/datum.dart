// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// import '../timing/timings.dart';
// import 'date.dart';
// import 'meta.dart';
// import 'timings.dart';

// part 'datum.g.dart';

// @JsonSerializable()
// class Datum extends Equatable {
//   final Timings? timings;
//   final Date? date;
//   final Meta? meta;

//   const Datum({this.timings, this.date, this.meta});

//   factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

//   Map<String, dynamic> toJson() => _$DatumToJson(this);

//   Datum copyWith({
//     Timings? timings,
//     Date? date,
//     Meta? meta,
//   }) {
//     return Datum(
//       timings: timings ?? this.timings,
//       date: date ?? this.date,
//       meta: meta ?? this.meta,
//     );
//   }

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props => [timings, date, meta];
// }
