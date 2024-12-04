import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramadantimes/src/quran/presentation/bloc/quran_bloc.dart';
import 'package:ramadantimes/src/quran/presentation/pages/quran_ayah_view.dart';
import 'package:quran/quran.dart' as quran;
import '../../data/repository/quran_utils.dart';
import '../widget/quran_surah_appbar.dart';

class QuranSurahView extends StatefulWidget {
  const QuranSurahView({super.key});

  @override
  State<QuranSurahView> createState() => _QuranSurahViewState();
}

class _QuranSurahViewState extends State<QuranSurahView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    context.read<QuranBloc>().add(QuranDataLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100.h),
          child: QuranSurahAppBar()),
      body: BlocBuilder<QuranBloc, QuranState>(
        builder: (context, state) {
          if (state is QuranInitial) {
            return Center(
              child: SpinKitThreeBounce(
                color: Colors.black,
              ),
            );
          }
          if (state is QuranLoaded) {
            return ListView.separated(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
              itemCount: state.quranSurahList.length,
              separatorBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 55.w, right: 20.w),
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
                          surahName: quran.getSurahName(surah.surahNumber),
                          surahNameTranslation: getSurahName(
                              surah.surahNumber, state.languageCode),
                          surahAyahNumber:
                              quran.getVerseCount(surah.surahNumber),
                          surahNumber: surah.surahNumber,
                          languageCode: state.languageCode,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 14.r,
                      child: Text(
                        surah.surahNumber.toString(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    title: Text(
                      surah.surahName,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      getSurahName(surah.surahNumber, state.languageCode),
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    trailing: SizedBox(
                      child: Text(
                        quran.getSurahNameArabic(surah.surahNumber),
                        style: GoogleFonts.amiriQuran(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Text('Error something went wrong');
        },
      ),
    );
  }
}
