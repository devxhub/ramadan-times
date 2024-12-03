import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ramadantimes/src/quran/data/repository/quran_repository.dart';

part 'quran_event.dart';
part 'quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  final QuranRepository quranRepository;

  QuranBloc({required this.quranRepository}) : super(QuranInitial()) {
    on<QuranDataLoadEvent>((event, emit) async {
      try {
        // QuranResponse response = await quranRepository.fetchQuranResponseTemp();

        await Future.delayed(Duration(seconds: 1));

        // emit(
        //   QuranLoaded(
        //     surahList: response.data!.surahs!,
        //   ),
        // );
      } catch (error) {
        emit(QuranError(errorMessage: error.toString()));
      }
    });
  }
}
