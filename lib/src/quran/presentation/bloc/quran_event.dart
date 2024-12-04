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
  const QuranLanguageChangeEvent({
    required this.languageCode,
    required this.language,
  });

  @override
  List<Object?> get props => [languageCode, language];
}

class QuranSearchEvent extends QuranEvent {
  final String query;

  const QuranSearchEvent(this.query);

  @override
  List<Object?> get props => [query];
}
