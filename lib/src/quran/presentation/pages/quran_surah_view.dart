import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ramadantimes/src/component/eng_to_bn.dart';
import 'package:ramadantimes/src/quran/presentation/bloc/quran_bloc.dart';
import 'package:ramadantimes/src/quran/presentation/pages/quran_ayah_view.dart';
import 'package:quran/quran.dart' as quran;
import '../../../../l10n/app_localizations.dart';
import '../../data/repository/quran_utils.dart';
import '../widget/quran_surah_appbar.dart';

class QuranSurahView extends StatefulWidget {
  const QuranSurahView({super.key});

  @override
  State<QuranSurahView> createState() => _QuranSurahViewState();
}

class _QuranSurahViewState extends State<QuranSurahView> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _currentlyPlayingSurah;

  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged() {
    context.read<QuranBloc>().add(QuranSearchEvent(_searchController.text));
  }

  @override
  void initState() {
    _searchController.addListener(_onSearchChanged);

    context.read<QuranBloc>().add(QuranDataLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            QuranSurahAppBar(searchController: _searchController),
            Expanded(
              child: BlocBuilder<QuranBloc, QuranState>(
                builder: (context, state) {
                  if (state is QuranLoaded) {
                    return ListView.separated(
                      primary: false,
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      itemCount: state.quranSurahList.length,
                      separatorBuilder: (context, index) => Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 40.w, right: 0.w),
                            child: Divider(),
                          ),
                        ],
                      ),
                      itemBuilder: (context, index) {
                        var surah = state.quranSurahList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuranAyahView(
                                  surahName: state.languageCode == 'en' ||
                                          state.languageCode == "fr" ||
                                          state.languageCode == "pt" ||
                                          state.languageCode == "id" ||
                                          state.languageCode == "sw" ||
                                          state.languageCode == "es"
                                      ? surah.surahName
                                      : getSurahName(surah.surahNumber,
                                          state.languageCode),
                                  surahAyahNumber:
                                      quran.getVerseCount(surah.surahNumber),
                                  surahNumber: surah.surahNumber,
                                  languageCode: state.languageCode,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 16.r,
                                child: Text(
                                  engToBn(
                                      surah.surahNumber.toString(), context),
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Gap(10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 150.w,
                                    child: Text(
                                      state.languageCode == 'en' ||
                                              state.languageCode == "fr" ||
                                              state.languageCode == "pt" ||
                                              state.languageCode == "id" ||
                                              state.languageCode == "sw" ||
                                              state.languageCode == "es"
                                          ? surah.surahName
                                          : getSurahName(surah.surahNumber,
                                              state.languageCode),
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 20.w),
                                    child: Text(
                                      quran.getSurahNameArabic(
                                          surah.surahNumber),
                                      style: GoogleFonts.amiriQuran(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ),
                                  Gap(5.h),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        checkConnectivityAndPlayAudio(
                                          surah.surahNumber,
                                          state.languageCode == 'en' ||
                                                  state.languageCode == "fr" ||
                                                  state.languageCode == "pt" ||
                                                  state.languageCode == "id" ||
                                                  state.languageCode == "sw" ||
                                                  state.languageCode == "es"
                                              ? surah.surahName
                                              : getSurahName(surah.surahNumber,
                                                  state.languageCode),
                                        );
                                      },
                                      icon: StreamBuilder<bool>(
                                        stream: _audioPlayer.playingStream,
                                        builder: (context, snapshot) {
                                          final isPlaying =
                                              _currentlyPlayingSurah ==
                                                      index + 1 &&
                                                  (snapshot.data ?? false);
                                          return Icon(
                                            isPlaying
                                                ? Icons.pause
                                                : Icons.play_arrow,
                                          );
                                        },
                                      ),
                                      label: Text(AppLocalizations.of(context)!
                                          .playSurah),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: SpinKitThreeBounce(
                        color: Colors.black,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkConnectivityAndPlayAudio(int surahNumber, String surahName) async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No internet connection. Please turn on internet'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      _playAudio(
        quran.getAudioURLBySurah(surahNumber),
        surahNumber,
        surahName,
      );
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  void _showAudioBottomSheet(String surahName) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                surahName,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              StreamBuilder<Duration?>(
                stream: _audioPlayer.durationStream,
                builder: (context, snapshot) {
                  final duration = snapshot.data ?? Duration.zero;
                  return StreamBuilder<Duration>(
                    stream: _audioPlayer.positionStream,
                    builder: (context, positionSnapshot) {
                      final position = positionSnapshot.data ?? Duration.zero;
                      return Column(
                        children: [
                          Slider(
                            value: position.inSeconds.toDouble(),
                            max: duration.inSeconds.toDouble(),
                            onChanged: (value) {
                              _audioPlayer
                                  .seek(Duration(seconds: value.toInt()));
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_formatDuration(position)),
                              Text(_formatDuration(duration)),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              StreamBuilder<bool>(
                stream: _audioPlayer.playingStream,
                builder: (context, snapshot) {
                  final isPlaying = snapshot.data ?? false;
                  return IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 36.sp,
                    ),
                    onPressed: () {
                      if (isPlaying) {
                        _audioPlayer.pause();
                      } else {
                        _audioPlayer.play();
                      }
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _playAudio(String url, int surahNumber, String surahName) async {
    try {
      if (_currentlyPlayingSurah == surahNumber && _audioPlayer.playing) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.setUrl(url);
        _audioPlayer.play();
        _showAudioBottomSheet(surahName);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error playing audio: $e");
      }
    }
  }
}
