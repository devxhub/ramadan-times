part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.signInDataSubmit({required String userEmail,required String userPassword,required BuildContext context}) = _SignInDataSubmit;
  const factory SignInEvent.isPasswordObscure() = _IsPasswordObscure;
  const factory SignInEvent.isConfirmPasswordObscure() = _IsConfirmPasswordObscure;
  const factory SignInEvent.isConfirmNewPasswordObscure() = _IsConfirmNewPasswordObscure;
  const factory SignInEvent.isRemember({required bool isRememberMe}) = _IsRemember;
}
