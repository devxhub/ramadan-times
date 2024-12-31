part of 'sign_in_bloc.dart';

enum SignInStatus {
  initial,
  success,
  failure,
  inProgress
}

enum PrayerStatus { initial, success, failure, inProgress }

@Freezed()
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(false) bool isRemember,
  }) = _SignInState;
}
