import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:muslimtimespro/src/auth/data/respositories/sign_in_repository.dart';
import 'package:muslimtimespro/src/models/address/district.dart';
import 'package:muslimtimespro/src/prayer_times/data/models/country_response.dart';
import 'package:muslimtimespro/src/prayer_times/data/models/manual_prayer_time.dart';
import 'package:muslimtimespro/src/prayer_times/data/models/prayer_times.dart';
import 'package:muslimtimespro/src/prayer_times/data/models/user_coordinates.dart';
import 'package:muslimtimespro/src/prayer_times/data/models/weather_model.dart';
import 'package:muslimtimespro/src/prayer_times/data/repositories/prayer_time_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepository signInRepository;

  SignInBloc({required this.signInRepository}) : super(const SignInState()) {
    on<SignInEvent>((events, emit) async {
      // await events.map(
      // );
    });
  }
}
