part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.signWithGoogle() = _SignWithGoogle;
  const factory SignUpEvent.signWithApple() = _SignWithApple;
  const factory SignUpEvent.signWithEmail({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) = _SignWithEmail;
  const factory SignUpEvent.isPasswordObscure() = _IsPasswordObscure;
  const factory SignUpEvent.isConfirmPasswordObscure() =
      _IsConfirmPasswordObscure;
  const factory SignUpEvent.updateContainerHeight({
    required double containerHeight,
  }) = _UpdateContainerHeight;
}
