import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:muslimtimespro/src/component/eng_to_bn.dart';
import 'package:muslimtimespro/src/quran/presentation/bloc/quran_bloc.dart';
import 'package:muslimtimespro/src/quran/presentation/pages/quran_ayah_view.dart';
import 'package:quran/quran.dart' as quran;
import '../../../../l10n/app_localizations.dart';
import '../../data/repository/quran_utils.dart';
import '../widget/quran_surah_app_bar.dart';
import '../widget/quran_surah_search_bar.dart';

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
    context.read<QuranBloc>().add(QuranDataLoadEvent(context: context));
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 40.h),
        child: QuranSurahAppBar(),
      ),
      body: Column(
        children: [
          QuranSurahSearchBar(searchController: _searchController),
          Expanded(
            child: BlocBuilder<QuranBloc, QuranState>(
              builder: (context, state) {
                if (state is QuranLoaded) {
                  return ListView.separated(
                    primary: false,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
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
                                    : getSurahName(
                                        surah.surahNumber, state.languageCode),
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
                                engToBn(surah.surahNumber.toString(), context),
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
                                    getSurahName(
                                        surah.surahNumber, state.languageCode),
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
                                    quran.getSurahNameArabic(surah.surahNumber),
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
      isDismissible: false, // Prevent dismissing the bottom sheet
      enableDrag: false, // Prevent dragging to dismiss
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            bool isAudioLoaded = false;
            Duration? audioDuration;
            Duration currentPosition = Duration.zero;

            _audioPlayer.playerStateStream.listen((state) {
              print("Player state: ${state.processingState}");
              if (state.processingState == ProcessingState.ready) {
                setState(() {
                  isAudioLoaded = true;
                });
              }
            });

            // Listen for changes in the duration
            _audioPlayer.durationStream.listen((duration) {
              if (duration != null) {
                setState(() {
                  audioDuration = duration;
                });
              }
            });

            // Listen for changes in the current playback position
            _audioPlayer.positionStream.listen((position) {
              setState(() {
                currentPosition = position;
              });
            });

            return Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        surahName,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          _audioPlayer.stop();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  if (!isAudioLoaded)
                    Center(
                      child: SpinKitThreeBounce(
                        color: Colors.black,
                      ),
                    ),
                  if (isAudioLoaded && audioDuration != null)
                    Column(
                      children: [
                        Slider(
                          value: currentPosition.inSeconds.toDouble(),
                          max: audioDuration!.inSeconds.toDouble(),
                          onChanged: (value) {
                            _audioPlayer.seek(Duration(seconds: value.toInt()));
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_formatDuration(currentPosition)),
                            Text(_formatDuration(audioDuration!)),
                          ],
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
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _playAudio(String url, int surahNumber, String surahName) async {
    try {
      _currentlyPlayingSurah = surahNumber;
      _showAudioBottomSheet(surahName);
      await _audioPlayer.setUrl(url);
      _audioPlayer.play();
    } catch (e) {
      if (kDebugMode) {
        print("Error playing audio: $e");
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to load audio. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
