part of 'quran_bloc.dart';

abstract class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object?> get props => [];
}

class QuranInitial extends QuranState {
  const QuranInitial();
}

class QuranLoaded extends QuranState {
  final String languageCode;
  final String language;
  final List<QuranModel> quranSurahList;

  const QuranLoaded({
    required this.languageCode,
    required this.language,
    required this.quranSurahList,
  });
  @override
  List<Object?> get props => [languageCode, language, quranSurahList];
}

class QuranError extends QuranState {
  final String? errorMessage;

  const QuranError({
    this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}

class QuranAudioLoading extends QuranState {
  const QuranAudioLoading();
}

// class QuranSuccce extends QuranState {
//   final String languageCode;
//   final String language;
//   final List<QuranModel> quranSurahList;

//   const QuranLoaded({
//     required this.languageCode,
//     required this.language,
//     required this.quranSurahList,
//   });
//   @override
//   List<Object?> get props => [languageCode, language, quranSurahList];
// }
