import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:muslimtimespro/l10n/app_localizations.dart';
import 'package:muslimtimespro/src/quran/data/repository/quran_data.dart';
import 'package:muslimtimespro/src/quran/data/repository/quran_repository.dart';
import '../../data/model/quran_model.dart';
part 'quran_event.dart';
part 'quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  final QuranRepository quranRepository;

  QuranBloc({required this.quranRepository}) : super(QuranInitial()) {
    on<QuranDataLoadEvent>((event, emit) async {
      try {
        emit(
          QuranLoaded(
            languageCode: AppLocalizations.of(event.context)!.localeName == 'bn'
                ? 'bn'
                : 'en',
            language: AppLocalizations.of(event.context)!.localeName == 'bn'
                ? 'bn'
                : 'English',
            quranSurahList: quranSurahList,
          ),
        );
      } catch (error) {
        emit(QuranError(errorMessage: error.toString()));
      }
    });
    on<QuranLanguageChangeEvent>((event, emit) async {
      emit(QuranInitial());
      Future.delayed(Duration(milliseconds: 500));
      emit(
        QuranLoaded(
          languageCode: event.languageCode,
          language: event.language,
          quranSurahList: event.quranSurahList,
        ),
      );
    });
    on<QuranSearchEvent>((event, emit) {
      if (state is QuranLoaded) {
        if (event.query.isEmpty) {
          final loadedState = state as QuranLoaded;
          emit(QuranLoaded(
            quranSurahList: quranSurahList,
            languageCode: loadedState.languageCode,
            language: loadedState.language,
          ));
        } else {
          final loadedState = state as QuranLoaded;
          final filteredList = loadedState.quranSurahList
              .where((surah) => surah.surahName
                  .toLowerCase()
                  .contains(event.query.toLowerCase()))
              .toList();

          emit(QuranLoaded(
            quranSurahList: filteredList,
            languageCode: loadedState.languageCode,
            language: loadedState.language,
          ));
        }
      }
    });
  }
}
