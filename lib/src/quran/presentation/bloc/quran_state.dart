part of 'quran_bloc.dart';

abstract class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object?> get props => [];
}

class QuranInitial extends QuranState {}

class QuranLoaded extends QuranState {
  final List<Surah> surahList;

  const QuranLoaded({
    required this.surahList,
  });
  @override
  List<Object?> get props => [surahList];
}

class QuranError extends QuranState {
  final String? errorMessage;

  const QuranError({
    this.errorMessage,
  });
  @override
  List<Object?> get props => [errorMessage];
}
