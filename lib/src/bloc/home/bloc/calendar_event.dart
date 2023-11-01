import 'package:equatable/equatable.dart';

import 'calendar_bloc.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DataFetched extends HomeEvent {
  // final String? categorySlug;

  final String date;
  final String country;
  final String? city;
  final int school;
  final int method;
  final bool isRefreshed;
 // final bool isFromDB;

  DataFetched( {
    //required this.isFromDB,
    required this.date,
    this.country = "Bangladesh",
    this.city,
    this.school = 1,
    this.method = 1,
    this.isRefreshed = false,

    // this.categorySlug,
  });
}

class CalendarDaySelected extends HomeEvent {
  final DateTime selectedDay;
  final DateTime? focusDay;

  CalendarDaySelected({
    required this.selectedDay,
    this.focusDay,

    // this.categorySlug,
  });
}
