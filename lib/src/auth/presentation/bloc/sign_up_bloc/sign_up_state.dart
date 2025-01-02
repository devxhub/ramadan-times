part of 'sign_up_bloc.dart';

enum SignInStatus { initial, success, failure, inProgress }

enum PrayerStatus { initial, success, failure, inProgress }

@Freezed()
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(true) bool isPasswordObscure,
    @Default(true) bool isConfirmNewPasswordObscure,
    @Default(500) double containerHeight,
  }) = _SignUpState;
}
