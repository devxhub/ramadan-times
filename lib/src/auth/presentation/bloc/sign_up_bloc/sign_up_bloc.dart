import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
}
