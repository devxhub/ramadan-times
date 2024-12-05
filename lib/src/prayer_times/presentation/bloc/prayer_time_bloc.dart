import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:ramadantimes/src/models/address/district.dart';
import 'package:ramadantimes/src/prayer_times/data/models/country_response.dart';
import 'package:ramadantimes/src/prayer_times/data/models/prayer_times.dart';
import 'package:ramadantimes/src/prayer_times/data/models/user_coordinates.dart';
import 'package:ramadantimes/src/prayer_times/data/models/weather_model.dart';
import 'package:ramadantimes/src/prayer_times/data/repositories/prayer_time_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'prayer_time_event.dart';
part 'prayer_time_state.dart';
part 'prayer_time_bloc.freezed.dart';

class PrayerTimeBloc extends Bloc<PrayerTimeEvent, PrayerTimeState> {
  final PrayerTimeRepository prayerTimeRepository;

  PrayerTimeBloc({required this.prayerTimeRepository})
      : super(const PrayerTimeState()) {
    on<PrayerTimeEvent>((events, emit) async {
      await events.map(
        prayerTimesDataLoaded: (event) async =>
            await _prayerTimesDataLoaded(event, emit),
        countryDataLoaded: (event) async =>
            await _countryDataLoaded(event, emit),
        locationPermission: (event) async =>
            await _locationPermission(event, emit),
        selectCountry: (event) async => await _selectCountry(event, emit),
        selectCity: (event) async => await _selectCity(event, emit),
        submitLocation: (event) async => await _submitLocation(event, emit),
        isDistrictSelected: (event) async =>
            await _isDistrictSelected(event, emit),
        weatherDataLoaded: (event) async =>
            await _weatherDataLoaded(event, emit),
        clearSelectedLocation: (event) async =>
            await _clearSelectedLocation(event, emit),
      );
    });
  }
  Future<void> _prayerTimesDataLoaded(
      _PrayerTimesDataLoaded event, Emitter<PrayerTimeState> emit) async {
    DateTime now = DateTime.now();
    DateTime nextDay = now.add(Duration(days: 1));
    emit(
      state.copyWith(
        prayerStatus: PrayerStatus.initial,
      ),
    );
    try {
      final prayerTimeDataResponse =
          await prayerTimeRepository.generatePrayerTimes(
        latitude: event.latitude,
        longitude: event.longitude,
        date: DateTime.now(),
      );
      final prayerTimeDataResponseNextDay =
          await prayerTimeRepository.generatePrayerTimes(
        latitude: event.latitude,
        longitude: event.longitude,
        date: nextDay,
      );
      emit(
        state.copyWith(
          prayerTimesResponse: prayerTimeDataResponse,
          prayerTimesResponseNextDay: prayerTimeDataResponseNextDay,
          prayerStatus: PrayerStatus.success,
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print("Error $e");
      }
      emit(
        state.copyWith(
          prayerStatus: PrayerStatus.failure,
        ),
      );
      rethrow;
    }
  }

  Future<void> _countryDataLoaded(
      _CountryDataLoaded event, Emitter<PrayerTimeState> emit) async {
    emit(
      state.copyWith(
        prayerTimeStatus: PrayerTimeStatus.initial,
      ),
    );
    try {
      final countryDataLoaded =
          await prayerTimeRepository.countryResponseDataLoaded();
      emit(
        state.copyWith(
          countryResponse: countryDataLoaded,
          prayerTimeStatus: PrayerTimeStatus.success,
        ),
      );
    } on DioException catch (e) {
      print("Errros $e");
      emit(
        state.copyWith(
          prayerTimeStatus: PrayerTimeStatus.failure,
        ),
      );
      rethrow;
    }
  }

  Future<void> _locationPermission(
      _LocationPermission event, Emitter<PrayerTimeState> emit) async {
    print("Init called ===1111");
    final prayerBloc = event.context.read<PrayerTimeBloc>();
    emit(
      state.copyWith(
        prayerTimeStatus: PrayerTimeStatus.initial,
      ),
    );
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    double userLat=prefs.getDouble('currentLatitude')??0.0;
    double userLng=prefs.getDouble('currentLongitude')??0.0;
    String userCity=prefs.getString('currentCity')??"";
    String userCountry=prefs.getString('currentCountry')??"";
    String userIsoCountryCode=prefs.getString('isoCountryCode')??"";
    var coordinator = UserCoordinator(
      userLat: userLat,
      userLng: userLng,
      userCountry:userCountry,
      userCity: userCity,
      userCountryIso: userIsoCountryCode,
    );
    if(userCity.isEmpty==true){
      try {
        bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          await Geolocator.requestPermission();
        }

        LocationPermission permission = await Geolocator.checkPermission();
        ConnectivityResult connection = await Connectivity().checkConnectivity();
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        double currentLatitude = prefs.getDouble('currentLatitude') ?? 23.7115253;
        double currentLongitude =
            prefs.getDouble('currentLongitude') ?? 90.4111451;
        String currentCity = prefs.getString('currentCity') ?? "Bangladesh";
        String currentCountry = prefs.getString('currentCountry') ?? "Dhaka";
        String currentIsoCode = prefs.getString('isoCountryCode') ?? "BD";

        if (connection == ConnectivityResult.none) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            _saveLocationToPreferences(23.7115253, 90.4111451);
            var userCoordinator = UserCoordinator(
              userLat: currentLatitude,
              userLng: currentLongitude,
              userCountry: currentCountry,
              userCity: currentCity,
              userCountryIso: currentIsoCode,
            );

            emit(
              state.copyWith(
                userCoordinator: userCoordinator,
                prayerTimeStatus: PrayerTimeStatus.success,
              ),
            );
            return;
          }
        }
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            _saveLocationToPreferences(23.7115253, 90.4111451);
            var userCoordinator = UserCoordinator(
              userLat: currentLatitude,
              userLng: currentLongitude,
              userCountry: currentCountry,
              userCity: currentCity,
              userCountryIso: currentIsoCode,
            );

            emit(
              state.copyWith(
                userCoordinator: userCoordinator,
                prayerTimeStatus: PrayerTimeStatus.success,
              ),
            );
            return;
          }
        }

        if (permission == LocationPermission.deniedForever) {
          _saveLocationToPreferences(23.7115253, 90.4111451);
          emit(
            state.copyWith(
              userCoordinator: UserCoordinator(
                userLat: currentLatitude,
                userLng: currentLongitude,
                userCountry: currentCountry,
                userCity: currentCity,
                userCountryIso: currentIsoCode,
              ),
              prayerTimeStatus: PrayerTimeStatus.success,
            ),
          );
        }

        Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 100,
          ),
        );

        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        String? city = placemarks.first.locality;
        String? country = placemarks.first.country;
        String? isoCountryCode = placemarks.first.country;

        _saveLocationToPreferences(position.latitude, position.longitude);

        prayerBloc.add(PrayerTimeEvent.prayerTimesDataLoaded(
          latitude: position.latitude,
          longitude: position.longitude,
        ));
        prayerBloc.add(PrayerTimeEvent.weatherDataLoaded(
          latitude: position.latitude,
          longitude: position.longitude,
          context: event.context,
        ));
        emit(
          state.copyWith(
            userCoordinator: UserCoordinator(
                userLat: position.latitude,
                userLng: position.longitude,
                userCountry: country,
                userCity: city,
                userCountryIso: placemarks.first.isoCountryCode),
            prayerTimeStatus: PrayerTimeStatus.success,
          ),
        );
        _saveCurrentLocationToPreferences(position.latitude, position.longitude,
            country!, city!, isoCountryCode!);
      }
      catch (e) {
        if (kDebugMode) {
          print("Error fetching location: $e");
        }
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        double currentLatitude = prefs.getDouble('currentLatitude') ?? 23.7115253;
        double currentLongitude =
            prefs.getDouble('currentLongitude') ?? 90.4111451;
        String currentCity = prefs.getString('currentCity') ?? "Bangladesh";
        String currentCountry = prefs.getString('currentCountry') ?? "Dhaka";
        String currentIsoCode = prefs.getString('isoCountryCode') ?? "BD";
        prayerBloc.add(PrayerTimeEvent.prayerTimesDataLoaded(
          latitude: currentLatitude,
          longitude: currentLongitude,
        ));
        prayerBloc.add(PrayerTimeEvent.weatherDataLoaded(
          latitude: currentLatitude,
          longitude: currentLongitude,
          context: event.context,
        ));
        var userCoordinator = UserCoordinator(
          userLat: currentLatitude,
          userLng: currentLongitude,
          userCountry: currentCountry,
          userCity: currentCity,
          userCountryIso: currentIsoCode,
        );
        emit(
          state.copyWith(
            userCoordinator: userCoordinator,
            prayerTimeStatus: PrayerTimeStatus.failure,
          ),
        );
      }
    }else{
      prayerBloc.add(PrayerTimeEvent.prayerTimesDataLoaded(
        latitude: coordinator.userLat??23.7115253,
        longitude: coordinator.userLng??90.4111451,
      ));
      prayerBloc.add(PrayerTimeEvent.weatherDataLoaded(
        latitude: coordinator.userLat??23.7115253,
        longitude: coordinator.userLng??90.4111451,
        context: event.context,
      ));
      emit(
        state.copyWith(
          userCoordinator:coordinator,
          prayerTimeStatus: PrayerTimeStatus.failure,
        ),
      );
    }

  }

  Future<void> _saveCurrentLocationToPreferences(double lat, double lng,
      String country, String city, String countryCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('currentLatitude', lat);
    await prefs.setDouble('currentLongitude', lng);
    await prefs.setString('currentCity', country);
    await prefs.setString('currentCountry', city);
    await prefs.setString('isoCountryCode', countryCode);
  }

  Future<void> _saveLocationToPreferences(double lat, double lng) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('latitude', lat);
    await prefs.setDouble('longitude', lng);
  }

  Future<Map<String, double>> loadSavedLocation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final double lat = prefs.getDouble('latitude') ?? 23.7115253;
    final double lng = prefs.getDouble('longitude') ?? 90.4111451;
    return {'latitude': lat, 'longitude': lng};
  }

  Future<void> _weatherDataLoaded(
      _WeatherDataLoaded event, Emitter<PrayerTimeState> emit) async {
    Future<void> saveWeatherTemp(double temp) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('weatherTemperature', temp);
    }

    emit(
      state.copyWith(
        prayerTimeStatus: PrayerTimeStatus.initial,
      ),
    );
    try {
      final response = await prayerTimeRepository.fetchWeatherData(
          event.latitude.toString(), event.longitude.toString());

      emit(
        state.copyWith(
          weatherResponse: response,
          prayerTimeStatus: PrayerTimeStatus.success,
        ),
      );
      await saveWeatherTemp(response.main?.temp ?? 0.0);
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching location: $e");
      }
      emit(
        state.copyWith(
          prayerTimeStatus: PrayerTimeStatus.failure,
        ),
      );
    }
  }

  Future<void> _selectCountry(
      _SelectCountry event, Emitter<PrayerTimeState> emit) async {
    emit(
      state.copyWith(
        isDistrictSelected: true,
        selectedDistrict: null,
        selectedCountry: event.country,
        prayerTimeStatus: PrayerTimeStatus.success,
      ),
    );
  }

  Future<void> _selectCity(
      _SelectCity event, Emitter<PrayerTimeState> emit) async {
    emit(
      state.copyWith(
        isDistrictSelected: true,
        selectedDistrict: event.district,
        prayerTimeStatus: PrayerTimeStatus.success,
      ),
    );
  }

  Future<void> _submitLocation(
      _SubmitLocation event, Emitter<PrayerTimeState> emit) async {
    final prayerBloc = event.context.read<PrayerTimeBloc>();
    prayerBloc.add(PrayerTimeEvent.prayerTimesDataLoaded(
      latitude: event.userCoordinator.userLat ?? 0.0,
      longitude: event.userCoordinator.userLng ?? 0.0,
    ));
    prayerBloc.add(PrayerTimeEvent.weatherDataLoaded(
      latitude: event.userCoordinator.userLat ?? 0.0,
      longitude: event.userCoordinator.userLng ?? 0.0,
      context: event.context,
    ));
_saveCurrentLocationToPreferences(event.userCoordinator.userLat ?? 0.0,event.userCoordinator.userLng ?? 0.0, event.userCoordinator.userCountry??'', event.userCoordinator.userCity??"",event.userCoordinator.userCountryIso??'');
    emit(
      state.copyWith(
          userCoordinator: event.userCoordinator,
          prayerTimeStatus: PrayerTimeStatus.success,
          selectedCountry: null,
          selectedDistrict: null),
    );
    event.context.goNamed("schedule");
  }

  Future<void> _isDistrictSelected(
      _IsDistrictSelected event, Emitter<PrayerTimeState> emit) async {
    emit(
      state.copyWith(
        isDistrictSelected: event.isDistrictSelected,
        prayerTimeStatus: PrayerTimeStatus.success,
      ),
    );
  }

  _clearSelectedLocation(
      _ClearSelectedLocation event, Emitter<PrayerTimeState> emit) {
    emit(
      state.copyWith(
        selectedDistrict: null,
        selectedCountry: null,
      ),
    );
  }
}
