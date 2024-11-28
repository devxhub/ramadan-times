import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import '../../data/model/quran_response.dart';

class QuranAyahView extends StatefulWidget {
  final Surah surahModel;

  const QuranAyahView({super.key, required this.surahModel});

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
      if (_currentlyPlayingAyah == ayahNumber && _audioPlayer.playing) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.setUrl(url);
        _audioPlayer.play();
        _showAudioBottomSheet(ayahNumber);
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
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Now Playing: Ayah $ayahNumber",
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
          widget.surahModel.englishName!,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: ListView.builder(
          itemCount: widget.surahModel.ayahs?.length ?? 0,
          itemBuilder: (context, index) {
            final ayah = widget.surahModel.ayahs![index];
            final audioUrl =
                "https://cdn.islamic.network/quran/audio/128/ar.alafasy/${ayah.numberInSurah}.mp3";

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ayah: ${ayah.numberInSurah}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          if (ayah.sajda == true)
                            Icon(
                              Icons.done,
                              color: Colors.green,
                              size: 18.sp,
                            ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      InteractiveViewer(
                        minScale: 1.0,
                        maxScale: 5.0,
                        child: Text(
                          ayah.text ?? '',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Gap(4.h),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Bismillah hir rahman nir raheem',
                              style: GoogleFonts.roboto(
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
                              text: 'Translation: ',
                              style: GoogleFonts.roboto(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'In the Name of Allah, the Most Beneficent, the Most Merciful.',
                              style: GoogleFonts.roboto(
                                fontSize: 13.sp,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          onPressed: () =>
                              _playAudio(audioUrl, ayah.numberInSurah!),
                          icon: StreamBuilder<bool>(
                            stream: _audioPlayer.playingStream,
                            builder: (context, snapshot) {
                              final isPlaying =
                                  _currentlyPlayingAyah == ayah.numberInSurah &&
                                      (snapshot.data ?? false);
                              return Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                              );
                            },
                          ),
                          label: Text('Play Audio'),
                        ),
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
}
