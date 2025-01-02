import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../data/models/sign_up_response.dart';
import '../../../data/respositories/sign_up_repository.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepository signUpRepository;

  SignUpBloc({required this.signUpRepository}) : super(const SignUpState()) {
    on<SignUpEvent>((events, emit) async {
      await events.map(
        signWithGoogle: (event) async => await _signInWithGoogle(event, emit),
        signWithApple: (event) async => await _signInWithApple(event, emit),
        signWithEmail: (event) async => await _signInWithEmail(event, emit),
        isPasswordObscure: (event) async =>
            await _isPasswordObscure(event, emit),
        isConfirmPasswordObscure: (event) async =>
            await _isConfirmPasswordObscure(event, emit),
        updateContainerHeight: (event) async =>
            await _updateContainerHeight(event, emit),
      );
    });
  }

  _signInWithGoogle(_SignWithGoogle event, Emitter<SignUpState> emit) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        if (kDebugMode) {
          print(
              'Google sign-in successful: ${googleUser.email} ${googleUser.photoUrl} ${googleUser.displayName}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Google sign-in failed: $e');
      }
    }
  }

  _signInWithApple(_SignWithApple event, Emitter<SignUpState> emit) async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      if (kDebugMode) {
        print(
            'Apple sign-in successful: ${credential.email} ${credential.givenName}${credential.familyName}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Apple sign-in failed: $e');
      }
    }
  }

  _signInWithEmail(_SignWithEmail event, Emitter<SignUpState> emit) async {
    SignUpResponse response = await signUpRepository.registerUser(
      email: event.email,
      name: event.name,
      password: event.password,
    );
    if (response.success == true) {
      Fluttertoast.showToast(
        msg: 'Sign Up successful, please login',
        backgroundColor: Colors.black,
        webPosition: 'bottom',
      );
      // ignore: use_build_context_synchronously
      event.context.pushReplacement(
        '/sign_in_page',
        extra: {
          'showBackButton': false,
        },
      );
    } else {
      Fluttertoast.showToast(
        msg: response.message ?? 'Sign up failed',
        backgroundColor: Colors.black,
        webPosition: 'bottom',
      );
    }
  }

  _isPasswordObscure(
      _IsPasswordObscure event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(isPasswordObscure: !state.isPasswordObscure));
  }

  _isConfirmPasswordObscure(
      _IsConfirmPasswordObscure event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(
        isConfirmNewPasswordObscure: !state.isConfirmNewPasswordObscure));
  }

  _updateContainerHeight(
      _UpdateContainerHeight event, Emitter<SignUpState> emit) {
    emit(state.copyWith(containerHeight: event.containerHeight));
  }
}
