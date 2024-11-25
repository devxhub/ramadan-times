import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/src/models/address/district.dart';
import 'package:ramadantimes/src/models/calendar_model/calendar_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dbHelper/dbErrorHelper.dart';
import '../../models/calendar_model/datum.dart';
import '../../models/timing/timeofmonth.dart';
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
  final dbHelperCalendar=DBHelp1.instance; //database initialize

  late List<TimeOfMonth>localSQFCalendar;

  late List<Datum> dataList;

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
    var connectivityResult = await Connectivity().checkConnectivity();
    try {
      final selectedDate =  DateFormat("dd MMM yyyy").format(event.selectedDay);
      print("this is selected date: $selectedDate");
      if(connectivityResult == ConnectivityResult.none){
        for(var data in dataList){
          final d = data.date!.readable;
          if(selectedDate == d){
            return emit(
              state.copyWith(
                status: CalendarStatus.success,
                focusDay: event.focusDay,
                selectedDay: event.selectedDay,
                selectedEvent: data,
              ),
            );
          }
        }
      }
      else{
        final Timing apiEvent = await apiService.timingByCity(
          date: DateFormat("dd-MM-yyyy").format(event.selectedDay),
          country: "Bangladesh",
          city: "Dhaka",
        );
        return emit(
          state.copyWith(
            status: CalendarStatus.success,
            focusDay: event.focusDay,
            selectedDay: event.selectedDay,
            selectedEvent: apiEvent.data,
          ),
        );
      }
      // print(state.datum.firstWhere((element) =>
      //     element.date?.gregorian?.date ==
      //     DateFormat("dd-mm-yyyy").format(event.selectedDay)));
      // print(
      //     "><><><><><>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<><><><><><><><><><><><><><<><><>");
    } catch (e) {
      return emit(state.copyWith(selectedEvent: null));
    }
  }

  Future<void> _onCalendarDataFetched(
    CalendarDataFetched event,
    Emitter<CalendarState> emit,
  ) async {
    //connectivity check
    var connectivityResultMasala = await (Connectivity().checkConnectivity());
   if(connectivityResultMasala==ConnectivityResult.none){

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

       //calendar read data store or save data
         localSQFCalendar = await dbHelperCalendar.readCalendar();
         dataList = localSQFCalendar.first.data!;//for 30 days data click calendar

         if(localSQFCalendar.isEmpty){
           return emit(state.copyWith(
             status: CalendarStatus.noData,
           ));
         }

        List<TimeOfMonth>? res=  localSQFCalendar.toList();
         print("Here is list of local Calender ${localSQFCalendar}");


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


           return emit(state.copyWith(
               status: CalendarStatus.success,
               datum: localSQFCalendar.first.data,
               selectedDay: state.selectedDay ?? DateTime.now(),
               selectedEvent: localSQFCalendar.first.data?.firstWhere(
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
   }else{
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
           final result = await apiService.timingByMonth(year: DateTime.now().year.toString(), month: DateTime.now().month.toString(), city: d.name.toString(), country: "Bangladesh");
           // db.saveCalendarData(productResp);
           dbHelperCalendar.createCalendar(result);
           //calendar data store or save data


           return emit(state.copyWith(
               status: CalendarStatus.success,
               datum: result.data,
               selectedDay: state.selectedDay ?? DateTime.now(),
               selectedEvent: result.data?.firstWhere(
                     (element) =>
                 element.date?.gregorian?.date ==
                     DateFormat("dd-MM-yyyy").format(
                       state.selectedDay ?? DateTime.now(),
                     ),
               ),
               focusDay: state.focusDay ?? DateTime.now(),
               hasReachedMax: false,
               page: state.page + 1),
           );
         }

         await sortedProductResp("recent");
       }
     } on Exception catch (_) {
       emit(state.copyWith(status: CalendarStatus.failure));
     }
   }
  }
}
