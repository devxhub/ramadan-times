part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.signInDataSubmit({required String userEmail,required String userPassword}) = _SignInDataSubmit;
}
