part of 'quran_bloc.dart';

abstract class QuranEvent extends Equatable {
  const QuranEvent();

  @override
  List<Object?> get props => [];
}

class QuranDataLoadEvent extends QuranEvent {
  final BuildContext context;

  const QuranDataLoadEvent({required this.context});
}

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

class QuranAudioLoadEvent extends QuranEvent {
  final Duration? audioDuration;
  final Duration? currentPosition;
  final bool isAudioLoaded;

  const QuranAudioLoadEvent({
    this.audioDuration,
    this.currentPosition,
    this.isAudioLoaded = false,
  });

  @override
  List<Object?> get props => [audioDuration, currentPosition, isAudioLoaded];
}

class QuranAudioPositionUpdateEvent extends QuranEvent {
  final Duration currentPosition;

  const QuranAudioPositionUpdateEvent(this.currentPosition);

  @override
  List<Object?> get props => [currentPosition];
}

class QuranAudioCompleteEvent extends QuranEvent {
  const QuranAudioCompleteEvent();

  @override
  List<Object?> get props => [];
}
