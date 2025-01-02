part of 'sign_up_bloc.dart';

enum SignInStatus { initial, success, failure, inProgress }

enum PrayerStatus { initial, success, failure, inProgress }

@Freezed()
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(false) bool isRemember,
  }) = _SignUpState;
}
