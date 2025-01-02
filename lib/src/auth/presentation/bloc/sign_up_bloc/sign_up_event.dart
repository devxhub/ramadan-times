part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.signWithGoogle() = _SignWithGoogle;
  const factory SignUpEvent.signWithApple() = _SignWithApple;
  const factory SignUpEvent.signWithEmail() = _SignWithEmail;
}
