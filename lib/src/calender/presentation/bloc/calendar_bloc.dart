import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadantimes/src/calender/data/repositories/calender_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/calendar_model/datum.dart';
import '../../../models/timing/timeofmonth.dart';
import 'calendar_event.dart';
import 'calendar_state.dart';

const throttleDuration = Duration(milliseconds: 100);

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final CalenderRepository calenderRepository;

  late List<TimeOfMonth> localSQFCalendar;

  late List<Datum> dataList;

  CalendarBloc({required this.calenderRepository}) : super(CalendarState()) {
    // on<CalendarDataFetched>(
    //   // _onCalendarDataFetched,
    //   transformer: throttleDroppable(throttleDuration),
    // );
    on<CalendarDaySelected>(
      _onCalendarDaySelected,
    );
  }

  Future<void> _onCalendarDaySelected(
    CalendarDaySelected event,
    Emitter<CalendarState> emit,
  ) async {
    try {
      final selectedDate = event.selectedDay;
      if (kDebugMode) {
        print("this is selected date: $selectedDate");
      }
      emit(state.copyWith(
        status: CalendarStatus.initial,
      ));
      try {
        double? latitude;
        double? longitude;
        getLatLongFromStorage() async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          latitude = prefs.getDouble('currentLatitude');
          longitude = prefs.getDouble('currentLongitude');
        }

        await getLatLongFromStorage();

        final calenderDataResponse =
            await calenderRepository.generatePrayerTimes(
          latitude: latitude!,
          longitude: longitude!,
          date: event.selectedDay,
        );
        emit(
          state.copyWith(
            status: CalendarStatus.success,
            selectedEvent: calenderDataResponse,
            selectedDay: event.selectedDay,
            focusDay: event.focusDay,
          ),
        );
      } on DioException catch (e) {
        if (kDebugMode) {
          print("Error $e");
        }
        emit(
          state.copyWith(
            status: CalendarStatus.failure,
          ),
        );
        rethrow;
      }
    } catch (e) {
      return emit(
        state.copyWith(
          selectedEvent: null,
          status: CalendarStatus.failure,
        ),
      );
    }
  }
}
