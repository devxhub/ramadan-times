import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/src/models/address/district.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/timing/timing.dart';
import 'calendar_event.dart';
import 'calendar_state.dart';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../services/api_service.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final ApiServices apiService;

  CalendarBloc({required this.apiService}) : super(CalendarState()) {
    on<CalendarDataFetched>(
      _onCalendarDataFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<CalendarDaySelected>(
      _onCalendarDaySelected,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onCalendarDaySelected(
    CalendarDaySelected event,
    Emitter<CalendarState> emit,
  ) async {
    try {
      final Timing apiEvent = await apiService.timingByCity(
        date: DateFormat("dd-MM-yyyy").format(event.selectedDay),
        country: "Bangladesh",
        city: "Dhaka",
      );
      // print(state.datum.firstWhere((element) =>
      //     element.date?.gregorian?.date ==
      //     DateFormat("dd-mm-yyyy").format(event.selectedDay)));
      // print(
      //     "><><><><><>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<><><><><><><><><><><><><><<><><>");
      return emit(
        state.copyWith(
          status: CalendarStatus.success,
          focusDay: event.focusDay,
          selectedDay: event.selectedDay,
          selectedEvent: apiEvent.data,
        ),
      );
    } catch (e) {
      return emit(state.copyWith(selectedEvent: null));
    }
  }

  Future<void> _onCalendarDataFetched(
    CalendarDataFetched event,
    Emitter<CalendarState> emit,
  ) async {
    if (event.isRefreshed) {
      emit(state.copyWith(
        status: CalendarStatus.initial,
        page: 1,
        datum: [],
        hasReachedMax: false,
      ));
    }

    try {
      if (state.status == CalendarStatus.initial ||
          state.status == CalendarStatus.success) {
        sortedProductResp(String sortBy) async {
          SharedPreferences preferences = await SharedPreferences.getInstance();

          District? d = District.fromJson(jsonDecode(
              preferences.getString("current_location") ??
                  jsonEncode(District(
                      id: "47",
                      division_id: "6",
                      name: "Dhaka",
                      bn_name: "ঢাকা",
                      lat: "23.7115253",
                      lon: "90.4111451",
                      url: "www.dhaka.gov.bd"))));
          final productResp = await apiService.calendarByCity(
              year: event.year ?? DateTime.now().year,
              month: event.month ?? DateTime.now().month,
              method: event.method ?? 1,
              school: event.school ?? 1,
              country: event.country ?? "Bangladesh",
              city: event.city ?? d.name);
          return emit(state.copyWith(
              status: CalendarStatus.success,
              datum: productResp.data,
              selectedDay: state.selectedDay ?? DateTime.now(),
              selectedEvent: productResp.data?.firstWhere(
                (element) =>
                    element.date?.gregorian?.date ==
                    DateFormat("dd-MM-yyyy").format(
                      state.selectedDay ?? DateTime.now(),
                    ),
              ),
              focusDay: state.focusDay ?? DateTime.now(),
              hasReachedMax: false,
              page: state.page + 1));
        }

        await sortedProductResp("recent");
      }
    } on Exception catch (_) {
      emit(state.copyWith(status: CalendarStatus.failure));
    }
  }
}
