import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../infinite_masail_list/masail_bloc.dart';
import '../infinite_masail_list/masail_event.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState(Locale('en'))) {
    on<InitializeLanguageEvent>(_onInitializeLanguage);
    on<ChangeLanguageEvent>(_onLanguageChanged);

    // Trigger the initialization event
    add(InitializeLanguageEvent());
  }

  /// Load the persisted language during initialization
  Future<void> _onInitializeLanguage(
      InitializeLanguageEvent event, Emitter<LanguageState> emit) async {
    final locale = await _getPersistedLocale();
    emit(LanguageState(locale));
  }

  /// Get the persisted locale from SharedPreferences
  Future<Locale> _getPersistedLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString('language_code') ?? 'en';
      return Locale(languageCode);
    } catch (e) {
      // Fallback to default locale in case of error
      return const Locale('en');
    }
  }

  /// Handle language change events
  Future<void> _onLanguageChanged(
      ChangeLanguageEvent event, Emitter<LanguageState> emit) async {
    try {
      final masailBloc = event.context.read<MasailBloc>();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language_code', event.locale.languageCode);
      // Fetch Masala Masail
      masailBloc.add(MasailFetched(
        isRefreshed: true,
      ));
      emit(LanguageState(event.locale));
    } catch (e) {
      // Optionally log the error
    }
  }
}
