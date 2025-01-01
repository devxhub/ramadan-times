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
    @Default(true) bool isPasswordObscure,
    @Default(SignInStatus.initial) SignInStatus signInStatus,
    @Default(SignInResponse()) SignInResponse signInResponse,
  }) = _SignInState;
}
