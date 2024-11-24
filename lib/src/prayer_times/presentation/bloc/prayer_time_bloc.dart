import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ramadantimes/src/prayer_times/data/models/prayer_times.dart';
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
      );
    });
  }
  Future<void> _prayerTimesDataLoaded(
      _PrayerTimesDataLoaded event,
      Emitter<PrayerTimeState> emit) async {
    emit(
      state.copyWith(
        prayerTimeStatus: PrayerTimeStatus.initial,
      ),
    );
    try {
      final prayerTimeDataResponse=await prayerTimeRepository.generatePrayerTimes();
      emit(
        state.copyWith(
          prayerTimesResponse: prayerTimeDataResponse,
          prayerTimeStatus: PrayerTimeStatus.initial,
        ),
      );
    } on DioException catch (e) {
      print("Errros $e");
      emit(
        state.copyWith(
          prayerTimeStatus: PrayerTimeStatus.initial,
        ),
      );
      rethrow;
    }
  }
}
