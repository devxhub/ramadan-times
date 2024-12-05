part of 'quran_bloc.dart';

abstract class QuranEvent extends Equatable {
  const QuranEvent();

  @override
  List<Object?> get props => [];
}

class QuranDataLoadEvent extends QuranEvent {}

class QuranLanguageChangeEvent extends QuranEvent {
  final String languageCode;
  final String language;
  final List<QuranModel> quranSurahList;
  const QuranLanguageChangeEvent({
    required this.languageCode,
    required this.language,
    required this.quranSurahList,
  });

  @override
  List<Object?> get props => [languageCode, language, quranSurahList];
}

class QuranSearchEvent extends QuranEvent {
  final String query;

  const QuranSearchEvent(this.query);

  @override
  List<Object?> get props => [query];
}
