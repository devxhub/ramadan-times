import 'package:ramadantimes/src/models/calendar_model/calendar_model.dart';
import 'package:ramadantimes/src/models/calendar_model/datum.dart';

import 'calendar_bloc.dart';

enum CalendarStatus { initial, success, failure ,noData }

class CalendarState {
  CalendarState({
    this.status = CalendarStatus.initial,
    this.data,
    this.datum = const [],
    this.hasReachedMax = false,
    this.page = 1,
    this.focusDay,
    this.selectedDay,
    this.selectedEvent,
  });

  final CalendarStatus status;
  final CalendarModel? data;
  final int page;
  final List<Datum>? datum;
  DateTime? focusDay;
  final DateTime? selectedDay;
  final Datum? selectedEvent;
  final bool hasReachedMax;

  CalendarState copyWith({
    CalendarStatus? status,
    CalendarModel? data,
    bool? hasReachedMax,
    List<Datum>? datum,
    Datum? selectedEvent,
    DateTime? focusDay,
    DateTime? selectedDay,
    int? page,
  }) {
    return CalendarState(
      status: status ?? this.status,
      focusDay: focusDay ?? this.focusDay,
      selectedDay: selectedDay ?? this.selectedDay,
      selectedEvent: selectedEvent ?? this.selectedEvent,
      data: data ?? this.data,
      page: page ?? this.page,
      datum: datum ?? this.datum,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''productState { status: $status, data: $selectedDay,}''';
  }

  List<Object> get props =>
      [status, data!, hasReachedMax, selectedDay!, selectedEvent!];
}
