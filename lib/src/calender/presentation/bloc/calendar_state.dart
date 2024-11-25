import '../../data/models/prayer_times.dart';

enum CalendarStatus { initial, success, failure, noData }

class CalendarState {
  CalendarState({
    this.status = CalendarStatus.initial,
    this.page = 1,
    this.focusDay,
    this.selectedDay,
    this.selectedEvent,
  });

  final CalendarStatus status;
  final int page;
  DateTime? focusDay;
  final DateTime? selectedDay;
  final CalenderResponse? selectedEvent;

  CalendarState copyWith({
    CalendarStatus? status,
    bool? hasReachedMax,
    CalenderResponse? selectedEvent,
    DateTime? focusDay,
    DateTime? selectedDay,
    int? page,
  }) {
    return CalendarState(
      status: status ?? this.status,
      focusDay: focusDay ?? this.focusDay,
      selectedDay: selectedDay ?? this.selectedDay,
      selectedEvent: selectedEvent ?? this.selectedEvent,
      page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '''productState { status: $status, data: $selectedDay,}''';
  }

  List<Object> get props => [
        status,
        selectedDay!,
        selectedEvent!,
      ];
}
