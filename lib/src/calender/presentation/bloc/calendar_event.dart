import 'package:equatable/equatable.dart';

abstract class CalendarEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// class CalendarDataFetched extends CalendarEvent {
//   final bool isRefreshed;
//   // final String? categorySlug;
//   final int? year;
//   final int? month;
//   final int? day;
//   final String? selectedDay;
//   final String? focusDay;
//   final String? country;
//   final String? city;
//   final int? school;
//   final int? method;

//   CalendarDataFetched({
//     this.year,
//     this.month,
//     this.day,
//     this.country,
//     this.city,
//     this.school,
//     this.selectedDay,
//     this.focusDay,
//     this.method,
//     this.isRefreshed = false,
//     // this.categorySlug,
//   });
// }

class CalendarDaySelected extends CalendarEvent {
  final DateTime selectedDay;
  final DateTime? focusDay;
  final double? latitude;
  final double? longitude;

  CalendarDaySelected({
    required this.selectedDay,
    this.focusDay,
    this.latitude,
    this.longitude,
  });
}
