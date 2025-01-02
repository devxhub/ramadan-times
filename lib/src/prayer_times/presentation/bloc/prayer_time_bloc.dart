import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:muslimtimespro/src/models/address/district.dart';
import 'package:muslimtimespro/src/prayer_times/data/models/country_response.dart';
import 'package:muslimtimespro/src/prayer_times/data/models/manual_prayer_time.dart';
import 'package:muslimtimespro/src/prayer_times/data/models/prayer_times.dart';
import 'package:muslimtimespro/src/prayer_times/data/models/user_coordinates.dart';
import 'package:muslimtimespro/src/prayer_times/data/models/weather_model.dart';
import 'package:muslimtimespro/src/prayer_times/data/repositories/prayer_time_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repositories/prayer_convertion_util.dart';
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
        clearSelectedCity: (event) async =>
            await _clearSelectedCity(event, emit),
        imsakTimeDataLoaded: (event) async =>
            await _imsakTimeDataLoaded(event, emit),
        isImsakTimeShow: (event) async => await _isImsakTimeShow(event, emit),
        autoDetectLocationStatusChange: (event) async =>
            await _autoDetectLocationStatusChange(event, emit),
        selectPrayerConvention: (event) async =>
            await _selectPrayerConvention(event, emit),
        selectAngle: (event) async => await _selectAngle(event, emit),
        selectCustomImsakTime: (event) async =>
            await _selectCustomImsakTime(event, emit),
        manuallyPrayerTimeChange: (event) async =>
            await _manuallyPrayerTimeChange(event, emit),
        manuallyPrayerTimeDataLoaded: (event) async =>
            await _manuallyPrayerTimeDataLoaded(event, emit),
        onchangeTimeSelected: (event) async =>
            await _onchangeTimeSelected(event, emit),
        resetManualPrayerTime: (event) async =>
            await _resetManualPrayerTime(event, emit),
        selectedTimeUpdate: (event) async =>
            await _selectedTimeUpdate(event, emit),
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
      // Safe reading from shared preferences
      String? selectedConvention = await readSelectedConvention();
      double? fajrAngle = await readFajrAngle();
      double? ishaAngle = await readIshaAngle();

      // Print values for debugging
      print("xxx $selectedConvention $fajrAngle $ishaAngle");

      // Use default values if any value is null
      final prayerTimeDataResponse =
          await prayerTimeRepository.generatePrayerTimes(
        latitude: event.latitude,
        longitude: event.longitude,
        date: DateTime.now(),
        calculationMethod:
            getCalculationMethod(selectedConvention ?? 'Muslim World League'),
        fajrAngle: fajrAngle!,
        ishaAngle: ishaAngle!,
      );

      final prayerTimeDataResponseNextDay =
          await prayerTimeRepository.generatePrayerTimes(
        latitude: event.latitude,
        longitude: event.longitude,
        date: nextDay,
        calculationMethod:
            getCalculationMethod(selectedConvention ?? 'Muslim World League'),
        fajrAngle: fajrAngle,
        ishaAngle: ishaAngle,
      );

      emit(
        state.copyWith(
          prayerTimesResponse: prayerTimeDataResponse,
          prayerTimesResponseNextDay: prayerTimeDataResponseNextDay,
          prayerStatus: PrayerStatus.success,
          selectedPrayerConventionName:
              selectedConvention ?? 'Muslim World League',
          selectedFajrAngle: fajrAngle,
          selectedIshaAngle: ishaAngle,
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
    double userLat = prefs.getDouble('currentLatitude') ?? 0.0;
    double userLng = prefs.getDouble('currentLongitude') ?? 0.0;
    String userCity = prefs.getString('currentCity') ?? "";
    String userCountry = prefs.getString('currentCountry') ?? "";
    String userIsoCountryCode = prefs.getString('isoCountryCode') ?? "";
    bool isAutoDetectLocationEnable =
        prefs.getBool('isAutoDetectLocationEnable') ?? false;

    var coordinator = UserCoordinator(
      userLat: userLat,
      userLng: userLng,
      userCountry: userCountry,
      userCity: userCity,
      userCountryIso: userIsoCountryCode,
    );
    if (userCity.isEmpty == true || isAutoDetectLocationEnable == true) {
      try {
        bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          await Geolocator.requestPermission();
        }

        LocationPermission permission = await Geolocator.checkPermission();
        List<ConnectivityResult> connection =
            await Connectivity().checkConnectivity();
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        double currentLatitude =
            prefs.getDouble('currentLatitude') ?? 23.7115253;
        double currentLongitude =
            prefs.getDouble('currentLongitude') ?? 90.4111451;
        String currentCity = prefs.getString('currentCity') ?? "Bangladesh";
        String currentCountry = prefs.getString('currentCountry') ?? "Dhaka";
        String currentIsoCode = prefs.getString('isoCountryCode') ?? "BD";

        if (connection.contains(ConnectivityResult.none)) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            _ensureLocationPreferencesAreSet();
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
                selectedCountry: Country(
                  name: currentCountry,
                ),
                selectedDistrict:currentCountry.toLowerCase()=='bangladesh'? District(
                  name: currentCity
                ):null,
                prayerTimeStatus: PrayerTimeStatus.success,
              ),
            );
            return;
          }
        }
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            _ensureLocationPreferencesAreSet();
            var userCoordinator = UserCoordinator(
              userLat: currentLatitude,
              userLng: currentLongitude,
              userCountry: currentCountry,
              userCity: currentCity,
              userCountryIso: currentIsoCode,
            );
            prayerBloc.add(PrayerTimeEvent.prayerTimesDataLoaded(
              latitude: currentLatitude,
              longitude: currentLongitude,
            ));

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
          _ensureLocationPreferencesAreSet();

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

        _ensureLocationPreferencesAreSet();

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
      } catch (e) {
        if (kDebugMode) {
          print("Error fetching location: $e");
        }
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        double currentLatitude =
            prefs.getDouble('currentLatitude') ?? 23.7115253;
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
      } finally {
        emit(
          state.copyWith(
            prayerTimeStatus: PrayerTimeStatus.success,
          ),
        );
      }
    }
    else {
      prayerBloc.add(PrayerTimeEvent.prayerTimesDataLoaded(
        latitude: coordinator.userLat ?? 23.7115253,
        longitude: coordinator.userLng ?? 90.4111451,
      ));
      prayerBloc.add(PrayerTimeEvent.weatherDataLoaded(
        latitude: coordinator.userLat ?? 23.7115253,
        longitude: coordinator.userLng ?? 90.4111451,
        context: event.context,
      ));
      emit(
        state.copyWith(
          userCoordinator: coordinator,
          selectedCountry: Country(
            name: userCountry,
          ),
          selectedDistrict:userCountry.toLowerCase()=='bangladesh'? District(
              name: userCity
          ):null,
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
    await prefs.setString('currentCity',city );
    await prefs.setString('currentCountry',country );
    await prefs.setString('isoCountryCode', countryCode);
  }

  Future<void> _ensureLocationPreferencesAreSet() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final double? currentLatitude = prefs.getDouble('currentLatitude');
    final double? currentLongitude = prefs.getDouble('currentLongitude');
    final String? currentCity = prefs.getString('currentCity');
    final String? currentCountry = prefs.getString('currentCountry');
    final String? isoCountryCode = prefs.getString('isoCountryCode');

    if (currentLatitude == null ||
        currentLongitude == null ||
        currentCity == null ||
        currentCountry == null ||
        isoCountryCode == null) {
      await _saveCurrentLocationToPreferences(
        23.7115253,
        90.4111451,
        'Bangladesh',
        'Dhaka',
        'BD',
      );
    }
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
    _saveCurrentLocationToPreferences(
        event.userCoordinator.userLat ?? 0.0,
        event.userCoordinator.userLng ?? 0.0,
        event.userCoordinator.userCountry ?? '',
        event.userCoordinator.userCity ?? "",
        event.userCoordinator.userCountryIso ?? '');
    emit(
      state.copyWith(
          userCoordinator: event.userCoordinator,
          prayerTimeStatus: PrayerTimeStatus.success,
      ),
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

  _clearSelectedCity(_ClearSelectedCity event, Emitter<PrayerTimeState> emit) {
    emit(
      state.copyWith(
        selectedDistrict: null,
      ),
    );
  }

  _imsakTimeDataLoaded(
      _ImsakTimeDataLoaded event, Emitter<PrayerTimeState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final isImsakEnable = prefs.getBool(
      'isImsakEnable',
    );
    final customImsakTime = prefs.getInt('customImsakTime');
    bool isAutoDetectLocationEnable =
        prefs.getBool('isAutoDetectLocationEnable') ?? false;
    emit(
      state.copyWith(
          isImsakEnable: isImsakEnable ?? false,
          isAutoDetectLocationEnable: isAutoDetectLocationEnable,
          imsakTime: customImsakTime ?? 0),
    );
  }

  _isImsakTimeShow(
      _IsImsakTimeShow event, Emitter<PrayerTimeState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isImsakEnable', event.isImsakEnable);

    emit(
      state.copyWith(isImsakEnable: event.isImsakEnable),
    );
  }

  _autoDetectLocationStatusChange(_AutoDetectLocationStatusChange event,
      Emitter<PrayerTimeState> emit) async {
    final prayerBloc = event.context.read<PrayerTimeBloc>();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isAutoDetectLocationEnable', event.isAutoDetectLocationEnable);
    prayerBloc.add(PrayerTimeEvent.locationPermission(context: event.context));
    emit(
      state.copyWith(
          isAutoDetectLocationEnable: event.isAutoDetectLocationEnable),
    );
  }

  _selectPrayerConvention(
    _SelectPrayerConvention event,
    Emitter<PrayerTimeState> emit,
  ) async {
    final prayerBloc = event.context.read<PrayerTimeBloc>();

    await writeSelectedConvention(event.prayerConventionName);
    await writeFajrAngle(event.fajrAngle);
    await writeIshaAngle(event.ishaAngle);
    emit(state.copyWith(
      selectedPrayerConventionName: event.prayerConventionName,
      selectedFajrAngle: event.fajrAngle,
      selectedIshaAngle: event.ishaAngle,
      userCoordinator: event.userCoordinator,
    ));
    prayerBloc.add(PrayerTimeEvent.prayerTimesDataLoaded(
      latitude: event.userCoordinator.userLat!,
      longitude: event.userCoordinator.userLng!,
    ));
  }

  _selectAngle(_SelectAngle event, Emitter<PrayerTimeState> emit) async {
    final prayerBloc = event.context.read<PrayerTimeBloc>();
    await writeSelectedConvention(event.prayerConventionName);
    await writeFajrAngle(event.fajrAngle);
    await writeIshaAngle(event.ishaAngle);
    emit(state.copyWith(
      selectedPrayerConventionName: event.prayerConventionName,
      selectedFajrAngle: event.fajrAngle,
      selectedIshaAngle: event.ishaAngle,
      userCoordinator: event.userCoordinator,
    ));
    prayerBloc.add(PrayerTimeEvent.prayerTimesDataLoaded(
      latitude: event.userCoordinator.userLat!,
      longitude: event.userCoordinator.userLng!,
    ));
  }

  _selectCustomImsakTime(
      _SelectCustomImsakTime event, Emitter<PrayerTimeState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('customImsakTime', event.customImsakTime);
    emit(state.copyWith(imsakTime: event.customImsakTime));
  }

  _manuallyPrayerTimeDataLoaded(_ManuallyPrayerTimeDataLoaded event,
      Emitter<PrayerTimeState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final fazr = prefs.getInt('Fajr');
    final dhuhr = prefs.getInt('Dhuhr');
    final asr = prefs.getInt('Asr');
    final maghrib = prefs.getInt('Maghrib');
    final isha = prefs.getInt('Isha');
    final sunrise = prefs.getInt('Sunrise');
    final manualPrayerTime = ManualPrayerTime(
      manualFajrTime: fazr,
      manualSunriseTime: sunrise,
      manualDhuhrTime: dhuhr,
      manualAsrTime: asr,
      manualMaghribTime: maghrib,
      manualIshaTime: isha,
    );

    emit(state.copyWith(manualPrayerTime: manualPrayerTime));
  }

  _manuallyPrayerTimeChange(
      _ManuallyPrayerTimeChange event, Emitter<PrayerTimeState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final updatedManualPrayerTime = event.manualPrayerTime;
    await prefs.setInt('Fajr', event.manualPrayerTime.manualFajrTime ?? 0);
    await prefs.setInt('Dhuhr', event.manualPrayerTime.manualDhuhrTime ?? 0);
    await prefs.setInt('Asr', event.manualPrayerTime.manualAsrTime ?? 0);
    await prefs.setInt(
        'Maghrib', event.manualPrayerTime.manualMaghribTime ?? 0);
    await prefs.setInt('Isha', event.manualPrayerTime.manualIshaTime ?? 0);
    await prefs.setInt(
        'Sunrise', event.manualPrayerTime.manualSunriseTime ?? 0);

    emit(state.copyWith(manualPrayerTime: updatedManualPrayerTime));
  }

  _onchangeTimeSelected(
      _OnchangeTimeSelected event, Emitter<PrayerTimeState> emit) async {
    emit(state.copyWith(selectedTime: event.onchangeTime));
  }

  _resetManualPrayerTime(
      _ResetManualPrayerTime event, Emitter<PrayerTimeState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('Fajr', 0);
    await prefs.setInt('Dhuhr', 0);
    await prefs.setInt('Asr', 0);
    await prefs.setInt('Maghrib', 0);
    await prefs.setInt('Isha', 0);
    await prefs.setInt('Sunrise', 0);
    emit(state.copyWith(manualPrayerTime: ManualPrayerTime()));
  }

  _selectedTimeUpdate(
      _SelectedTimeUpdate event, Emitter<PrayerTimeState> emit) async {
    emit(state.copyWith(selectedTime: event.time));
  }
}
