import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramadantimes/src/quran/presentation/bloc/quran_bloc.dart';
import 'package:ramadantimes/src/quran/presentation/pages/quran_ayah_view.dart';

import '../widget/quran_surah_appbar.dart';

class QuranSurahView extends StatefulWidget {
  const QuranSurahView({super.key});

  @override
  State<QuranSurahView> createState() => _QuranSurahViewState();
}

class _QuranSurahViewState extends State<QuranSurahView> {
  @override
  void initState() {
    context.read<QuranBloc>().add(QuranDataLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuranSurahAppBar(),
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
              padding: EdgeInsets.symmetric(vertical: 10.h),
              itemCount: state.surahList.length,
              separatorBuilder: (context, index) => Column(
                children: [
                  Gap(4.h),
                  Padding(
                    padding: EdgeInsets.only(left: 55.w, right: 20.w),
                    child: Divider(),
                  ),
                  Gap(4.h),
                ],
              ),
              itemBuilder: (context, index) {
                var surah = state.surahList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuranAyahView(
                                surahModel: surah,
                              )),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 14.r,
                      child: Text(surah.number.toString()),
                    ),
                    title: Text(
                      surah.englishName!,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    subtitle: Text(
                      surah.englishNameTranslation!,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    trailing: Text(
                      surah.name!,
                      style: GoogleFonts.amiri(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Text('Something went wrong');
        },
      ),
    );
  }
}
