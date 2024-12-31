import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:muslimtimespro/src/dbHelper/dbErrorHelper.dart';
import 'package:muslimtimespro/src/models/weather/weather_model_final.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/address/district.dart';
import '../../../models/timing/timing.dart';
import '../../../services/api_service.dart';
import 'calendar_event.dart';
import 'calendar_state.dart';

const throttleDuration = Duration(milliseconds: 100);

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiServices apiService;

  final dbHelper = DBHelp1.instance; //database initialize

  late List<Timing> timeOfLocalSQF; //offline data store

  late WeatherModelFinal weatherData;

  late List<Main> localSQFWeather;

  HomeBloc({required this.apiService}) : super(HomeState()) {
    on<DataFetched>(
      _onDataFetched,
    );
  }

  Future<void> _onDataFetched(
    DataFetched event,
    Emitter<HomeState> emit,
  ) async {
    if (event.isRefreshed) {
      emit(state.copyWith(
        status: HomeStatus.initial,
        timeOfToday: null,
        timeOfNextDay: null,
        weatherData: null,
      ));
    }

    try {
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

      List<String> temp = event.date.split("-");

      DateTime nextDate =
          DateTime(int.parse(temp[2]), int.parse(temp[1]), int.parse(temp[0]))
              .add(const Duration(days: 1));

      //internet connectivity check and show per prediction
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        localSQFWeather = await dbHelper.readWeatherlList();

        //showAlertDialog
        timeOfLocalSQF = await dbHelper.readRamadanTimes();
        if (timeOfLocalSQF.isEmpty) {
          return emit(state.copyWith(
            status: HomeStatus.noData,
          ));
        }
      } else {
        final Timing timeOfToday = await apiService.timingByCity(
            date: event.date,
            method: event.method,
            school: event.school,
            country: event.country,
            city: event.city ?? d.name.toString());
        final timeOfNextDay = await apiService.timingByCity(
            date: DateFormat("dd-MM-yyyy").format(nextDate),
            method: event.method,
            school: event.school,
            country: event.country,
            city: event.city ?? d.name.toString());

        //weather

        weatherData = await apiService.fetchWeatherData(d.lat!, d.lon!);

        dbHelper.createWeather(weatherData
            .main!); //calendar data store or save data or create data call
        localSQFWeather = await dbHelper.readWeatherlList();

        //for offline timingTable data store
        final timeList = [timeOfToday, timeOfNextDay];
        dbHelper.createRamadanTimes(timeList);
        timeOfLocalSQF = await dbHelper.readRamadanTimes();

        // print(timeOfLocalSQF.toString());
      }
      return emit(state.copyWith(
        status: HomeStatus.success,
        timeOfToday: timeOfLocalSQF.first,
        timeOfNextDay: timeOfLocalSQF.last,
        weatherData: localSQFWeather.first,
      ));
    } on Exception catch (_) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
