part of 'sign_up_bloc.dart';

enum SignUpStatus { initial, success, failure, inProgress }

@Freezed()
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(true) bool isPasswordObscure,
    @Default(true) bool isConfirmNewPasswordObscure,
    @Default(500) double containerHeight,
    @Default(SignUpStatus.initial) SignUpStatus signUpStatus,
  }) = _SignUpState;
}
