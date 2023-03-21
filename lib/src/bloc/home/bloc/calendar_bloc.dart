import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/address/district.dart';
import '../../../services/api_service.dart';
import 'calendar_event.dart';
import 'calendar_state.dart';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiServices apiService;

  HomeBloc({required this.apiService}) : super(HomeState()) {
    on<DataFetched>(
      _onCategoryProductFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    // on<CalendarDaySelected>(
    //   _onCalendarDaySelected,
    //   transformer: throttleDroppable(throttleDuration),
    // );
  }

  // Future<void> _onCalendarDaySelected(
  //   CalendarDaySelected event,
  //   Emitter<HomeState> emit,
  // ) async {
  //   try {
  //     return emit(state.copyWith(
  //         status: HomeStatus.success,
  //         selectedEvent: state.datum.firstWhere((element) =>
  //             element.date?.gregorian?.date ==
  //             DateFormat("dd-mm-yyyy").format(event.selectedDay))));
  //   } catch (e) {
  //     return emit(state.copyWith(selectedEvent: null));
  //   }
  // }

  Future<void> _onCategoryProductFetched(
    DataFetched event,
    Emitter<HomeState> emit,
  ) async {
    // if (event.) {
    //   emit(state.copyWith(
    //     status: CalendarStatus.initial,
    //     timeOfToday: null,
    //     timeOfNextDay: null,
    //   ));
    // }

    try {
      if (state.status == HomeStatus.initial ||
          state.status == HomeStatus.success) {
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
        sortedProductResp(String sortBy) async {
          final timeOfToday = await apiService.timingByCity(
              date: event.date,
              method: event.method,
              school: event.school,
              country: event.country,
              city: event.city ?? d.name);
          List<String> temp = event.date.split("-");
          DateTime nextDate = DateTime(
                  int.parse(temp[2]), int.parse(temp[1]), int.parse(temp[0]))
              .add(const Duration(days: 1));

          final timeOfNextDay = await apiService.timingByCity(
              date: DateFormat("dd-mm-yyyy").format(nextDate),
              method: event.method,
              school: event.school,
              country: event.country,
              city: event.city ?? d.name);
          return emit(state.copyWith(
            status: HomeStatus.success,
            timeOfToday: timeOfToday,
            timeOfNextDay: timeOfNextDay,
          ));
        }

        await sortedProductResp("recent");
      }
    } on Exception catch (_) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
