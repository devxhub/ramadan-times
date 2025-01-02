import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:ramadantimes/src/app.dart';
import 'package:ramadantimes/src/auth/data/models/sign_in_response.dart';
import 'package:ramadantimes/src/auth/data/respositories/sign_in_repository.dart';
import 'package:ramadantimes/src/services/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepository signInRepository;

  SignInBloc({required this.signInRepository})
      : super(const SignInState()) {
    on<SignInEvent>((events, emit) async {
      await events.map(
        isPasswordObscure: (event) async =>
      await _isPasswordObscure(event, emit),
        isConfirmPasswordObscure: (event) async =>
      await _isConfirmPasswordObscure(event, emit),
        isConfirmNewPasswordObscure:(event) async =>
        await _isConfirmNewPasswordObscure(event, emit) ,
        isRemember: (event) async =>
        await _isRemember(event, emit),
       signInDataSubmit: (event) async =>
        await _signInDataSubmit(event, emit),
        forgetPasswordOtpSubmit: (event) async =>
        await _forgetPasswordOtpSubmit(event, emit),
      );
    });
  }
  _isPasswordObscure(
      _IsPasswordObscure event, Emitter<SignInState> emit) async {
    emit(state.copyWith(isPasswordObscure: !state.isPasswordObscure));
  }
  _isConfirmPasswordObscure(
      _IsConfirmPasswordObscure event, Emitter<SignInState> emit) async {
    emit(state.copyWith(isNewPasswordObscure: !state.isNewPasswordObscure));
  }_isConfirmNewPasswordObscure(
      _IsConfirmNewPasswordObscure event, Emitter<SignInState> emit) async {
    emit(state.copyWith(isConfirmNewPasswordObscure: !state.isConfirmNewPasswordObscure));
  }
  _isRemember(
      _IsRemember event, Emitter<SignInState> emit) async {
    emit(state.copyWith(isRemember: event.isRememberMe));
  }
  _signInDataSubmit(
      _SignInDataSubmit event, Emitter<SignInState> emit) async {
    emit(state.copyWith(
        signInStatus: SignInStatus.inProgress
    ));
    try {
  final resp = await signInRepository.signInDataSubmit(email: event.userEmail, password: event.userPassword,);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.setString(Constant.token, resp.token??'');
if(state.isRemember==true){
  await prefs.setBool(Constant.isRememberMe, true);
  await prefs.setString(Constant.email, event.userEmail);
  await prefs.setString(Constant.password, event.userPassword);
}
event.context.goNamed("scheduled");
  emit(state.copyWith(
    signInResponse: resp,
      signInStatus: SignInStatus.success
  ));
    } on DioException catch (e) {


      dynamic responseData = e.response?.data;
      String errorMessage = '';

      if (responseData is String) {
        errorMessage = responseData;
      } else if (responseData is Map<String, dynamic> &&
          responseData.containsKey("message")) {
        if (responseData["message"] is String) {
          errorMessage = responseData["message"];
        } else if (responseData["message"] is Map<String, dynamic>) {
          Map<String, dynamic> errorMap = responseData["message"];
          errorMessage = errorMap.values.join('\n');
        }
      }

      errorMessage = errorMessage.isNotEmpty
          ? errorMessage
          : 'An unexpected error occurred';
      ScaffoldMessenger.of(event.context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
      // await Fluttertoast.showToast(
      //   webPosition: "center",
      //   msg: errorMessage,
      // );

      emit(state.copyWith(
signInStatus: SignInStatus.failure
      ));
    }


  }
  _forgetPasswordOtpSubmit(
      _ForgetPasswordOtpSubmit event, Emitter<SignInState> emit) async {
    emit(state.copyWith(
        signInStatus: SignInStatus.inProgress
    ));
    try {
      event.context.pushNamed("forget_password_otp_page");
  emit(state.copyWith(
   forgetPasswordMail: event.forgetPasswordMail,
      signInStatus: SignInStatus.success
  ));
    } on DioException catch (e) {


      dynamic responseData = e.response?.data;
      String errorMessage = '';

      if (responseData is String) {
        errorMessage = responseData;
      } else if (responseData is Map<String, dynamic> &&
          responseData.containsKey("message")) {
        if (responseData["message"] is String) {
          errorMessage = responseData["message"];
        } else if (responseData["message"] is Map<String, dynamic>) {
          Map<String, dynamic> errorMap = responseData["message"];
          errorMessage = errorMap.values.join('\n');
        }
      }

      errorMessage = errorMessage.isNotEmpty
          ? errorMessage
          : 'An unexpected error occurred';
      // ScaffoldMessenger.of(event.context).showSnackBar(
      //   SnackBar(
      //     content: Text(errorMessage),
      //     backgroundColor: Colors.red,
      //   ),
      // );
      // await Fluttertoast.showToast(
      //   webPosition: "center",
      //   msg: errorMessage,
      // );

      emit(state.copyWith(
signInStatus: SignInStatus.failure
      ));
    }


  }
}
