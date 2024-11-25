import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:ramadantimes/main.dart';
import 'package:ramadantimes/src/models/address/district.dart';
import 'package:ramadantimes/src/prayer_times/data/models/country_response.dart';
import 'package:ramadantimes/src/prayer_times/data/models/prayer_times.dart';
import 'package:ramadantimes/src/prayer_times/data/models/user_coordinates.dart';
import 'package:ramadantimes/src/prayer_times/data/repositories/prayer_time_repository.dart';

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
        selectCountry: (event) async =>
        await _selectCountry(event, emit),
        selectCity: (event) async =>
        await _selectCity(event, emit),
        submitLocation: (event) async =>
        await _submitLocation(event, emit),
        isDistrictSelected: (event) async =>
        await _isDistrictSelected(event, emit),

      );
    });
  }
  Future<void> _prayerTimesDataLoaded(
      _PrayerTimesDataLoaded event,
      Emitter<PrayerTimeState> emit) async {
    emit(
      state.copyWith(
        prayerStatus: PrayerStatus.initial,
      ),
    );
    try {

      final prayerTimeDataResponse=await prayerTimeRepository.generatePrayerTimes(latitude:event.latitude,longitude: event.longitude);
      emit(
        state.copyWith(
          prayerTimesResponse: prayerTimeDataResponse,
          prayerStatus: PrayerStatus.success,
        ),
      );
    } catch (e) {
      print("Errros $e");
      emit(
        state.copyWith(
          prayerStatus: PrayerStatus.failure,
        ),
      );
      rethrow;
    }
  }
  Future<void> _countryDataLoaded(
      _CountryDataLoaded event,
      Emitter<PrayerTimeState> emit) async
  {
    emit(
      state.copyWith(
        prayerTimeStatus: PrayerTimeStatus.initial,
      ),
    );
    try {
      final countryDataLoaded=await prayerTimeRepository.countryResponseDataLoaded();
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
      _LocationPermission event,
      Emitter<PrayerTimeState> emit) async
  {
final prayerBloc= event.context.read<PrayerTimeBloc>();
    emit(
      state.copyWith(
        prayerTimeStatus: PrayerTimeStatus.initial,
      ),
    );
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception("Location services are disabled.");
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception("Location permissions are denied.");
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception("Location permissions are permanently denied.");
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
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        String? city = place.locality;
        String? country = place.country;

      }
      prayerBloc.add(  PrayerTimeEvent.prayerTimesDataLoaded(latitude:  position.latitude??0.0, longitude: position.longitude,));
      print("Final state is 111");
      emit(

        state.copyWith(
          userCoordinator: UserCoordinator(
            userLat: position.latitude,
            userLng: position.longitude,
            userCountry: placemarks.first.country,
            userCity: placemarks.first.locality,
            userCountryIso: placemarks.first.isoCountryCode
          ),
          prayerTimeStatus: PrayerTimeStatus.success,
        ),

      );


      print("Final state is ${state.userCoordinator.userLat}====${state.userCoordinator.userLng}");
    }
    catch (e) {
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
      _SelectCountry event,
      Emitter<PrayerTimeState> emit) async
  {
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
      _SelectCity event,
      Emitter<PrayerTimeState> emit) async
  {
    emit(
      state.copyWith(
        isDistrictSelected: true,
        selectedDistrict: event.district,
        prayerTimeStatus: PrayerTimeStatus.success,
      ),
    );
  }
  Future<void> _submitLocation(
      _SubmitLocation event,
      Emitter<PrayerTimeState> emit) async
  {
    final prayerBloc= event.context.read<PrayerTimeBloc>();
    prayerBloc.add(  PrayerTimeEvent.prayerTimesDataLoaded(latitude:  event.userCoordinator.userLat??0.0, longitude: event.userCoordinator.userLng??0.0,));
    emit(
      state.copyWith(
        userCoordinator: event.userCoordinator,
        prayerTimeStatus: PrayerTimeStatus.success,
        selectedCountry: null,
        selectedDistrict: null
      ),
    );
    event.context.goNamed("schedule");
  }
  Future<void> _isDistrictSelected(
      _IsDistrictSelected event,
      Emitter<PrayerTimeState> emit) async
  {
    emit(
      state.copyWith(
        isDistrictSelected: event.isDistrictSelected,
        prayerTimeStatus: PrayerTimeStatus.success,
      ),
    );
  }

}
