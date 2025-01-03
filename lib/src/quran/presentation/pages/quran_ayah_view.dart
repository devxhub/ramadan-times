import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/quran.dart' as quran;
import 'package:muslimtimespro/l10n/app_localizations.dart';
import 'package:muslimtimespro/src/component/eng_to_bn.dart';

import '../../data/repository/quran_utils.dart';

class QuranAyahView extends StatefulWidget {
  final String surahName;
  final String languageCode;
  final int surahAyahNumber;
  final int surahNumber;
  const QuranAyahView({
    super.key,
    required this.surahName,
    required this.surahAyahNumber,
    required this.surahNumber,
    required this.languageCode,
  });

  @override
  State<QuranAyahView> createState() => _QuranAyahViewState();
}

class _QuranAyahViewState extends State<QuranAyahView> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _currentlyPlayingAyah;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playAudio(String url, int ayahNumber) async {
    try {
      _showAudioBottomSheet(ayahNumber);
      if (_currentlyPlayingAyah == ayahNumber && _audioPlayer.playing) {
        await _audioPlayer.pause();
        setState(() {
          _currentlyPlayingAyah = null;
        });
      } else {
        await _audioPlayer.setUrl(url);
        _audioPlayer.play();
        setState(() {
          _currentlyPlayingAyah = ayahNumber;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error playing audio: $e");
      }
    }
  }

  void _showAudioBottomSheet(int ayahNumber) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${AppLocalizations.of(context)!.nowPlaying}: ${AppLocalizations.of(context)!.ayah} ${engToBn(ayahNumber.toString(), context)}",
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
                      setState(() {});
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

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: CircleAvatar(
              radius: 12.r,
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
        title: Text(
          widget.surahName,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        actions: [
          Text(
            "${AppLocalizations.of(context)!.revealedIn}: ${quran.getPlaceOfRevelation(widget.surahNumber) == "Makkah" ? AppLocalizations.of(context)!.makkah : AppLocalizations.of(context)!.madinah}",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Gap(20.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: ListView.builder(
          itemCount: widget.surahAyahNumber,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      InteractiveViewer(
                        minScale: 1.0,
                        maxScale: 5.0,
                        child: Text(
                          quran.getVerse(widget.surahNumber, index + 1,
                              verseEndSymbol: true),
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.amiriQuran(
                              fontSize: 28.sp,
                              color: Colors.black87,
                              height: 1.8.sp),
                        ),
                      ),
                      Gap(4.h),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '${AppLocalizations.of(context)!.transliteration}: ',
                              style: GoogleFonts.roboto(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            TextSpan(
                              text: getVerseTransliteration(
                                  widget.surahNumber, index + 1),
                              style: GoogleFonts.kanit(
                                fontSize: 13.sp,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(4.h),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '${AppLocalizations.of(context)!.translation}: ',
                              style: GoogleFonts.roboto(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            TextSpan(
                              text: quran.getVerseTranslation(
                                  widget.surahNumber, index + 1,
                                  verseEndSymbol: true,
                                  translation: getSurahVerseTranslation(
                                      widget.languageCode)),
                              style: GoogleFonts.amiri(
                                fontSize: 13.sp,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${AppLocalizations.of(context)!.ayah}: ${engToBn((index + 1).toString(), context)}",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              if (quran.isSajdahVerse(
                                  widget.surahNumber, index + 1))
                                Icon(
                                  Icons.done,
                                  color: Colors.green,
                                  size: 18.sp,
                                ),
                            ],
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                checkConnectivityAndPlayAudio(index);
                              },
                              icon: StreamBuilder<bool>(
                                stream: _audioPlayer.playingStream,
                                builder: (context, snapshot) {
                                  final isPlaying =
                                      _currentlyPlayingAyah == index + 1 &&
                                          (snapshot.data ?? false);
                                  return Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                  );
                                },
                              ),
                              label: StreamBuilder<bool>(
                                stream: _audioPlayer.playingStream,
                                builder: (context, snapshot) {
                                  final isPlaying =
                                      _currentlyPlayingAyah == index + 1 &&
                                          (snapshot.data ?? false);
                                  return Text(isPlaying
                                      ? AppLocalizations.of(context)!.pauseAyah
                                      : AppLocalizations.of(context)!.playAyah);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void checkConnectivityAndPlayAudio(int index) async {
    if (!await hasInternetAccess()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.onInternetConnection),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      _playAudio(
        quran.getAudioURLByVerse(widget.surahNumber, index + 1),
        index + 1,
      );
    }
  }

  Future<bool> hasInternetAccess() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
