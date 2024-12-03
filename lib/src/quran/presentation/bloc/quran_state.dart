part of 'quran_bloc.dart';

abstract class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object?> get props => [];
}

class QuranInitial extends QuranState {}

class QuranLoaded extends QuranState {
  // final List<Surah> surahList;
  final String languageCode;

  const QuranLoaded({
    required this.languageCode,
  });
  @override
  List<Object?> get props => [languageCode];
}

class QuranError extends QuranState {
  final String? errorMessage;

  const QuranError({
    this.errorMessage,
  });
  @override
  List<Object?> get props => [errorMessage];
}
