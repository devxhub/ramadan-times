part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.signInDataSubmit(
      {required String userEmail,
      required String userPassword,
      required BuildContext context}) = _SignInDataSubmit;
  const factory SignInEvent.isPasswordObscure() = _IsPasswordObscure;
  const factory SignInEvent.isConfirmPasswordObscure() =
      _IsConfirmPasswordObscure;
  const factory SignInEvent.isConfirmNewPasswordObscure() =
      _IsConfirmNewPasswordObscure;
  const factory SignInEvent.isRemember({required bool isRememberMe}) =
      _IsRemember;
  const factory SignInEvent.forgetPasswordEmailSubmit({required String forgetPasswordMail,required BuildContext context}) = _ForgetPasswordEmailSubmit;
  const factory SignInEvent.forgetPasswordOtpSubmit({required String forgetPasswordMail,required BuildContext context}) = _ForgetPasswordOtpSubmit;
  const factory SignInEvent.resetPassword({required String forgetPasswordMail,required String password,required BuildContext context}) = _ResetPassword;
  const factory SignInEvent.forgetPasswordOtpOnChanged({required String forgetPasswordOtp,required BuildContext context}) = _ForgetPasswordOtpOnChanged;
  const factory SignInEvent.updateContainerHeight({
    required double containerHeight,
  }) = _UpdateContainerHeight;
}
