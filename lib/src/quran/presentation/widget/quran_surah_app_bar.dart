import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/repository/quran_language_data.dart';
import '../bloc/quran_bloc.dart';

class QuranSurahAppBar extends StatelessWidget {
  const QuranSurahAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          context.goNamed("schedule");
        },
        child: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: CircleAvatar(
            radius: 15.r,
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
      title: Text(
        AppLocalizations.of(context)!.quran,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
      actions: [
        BlocBuilder<QuranBloc, QuranState>(
          builder: (context, state) {
            if (state is QuranLoaded) {
              String selectedLanguage =
                  AppLocalizations.of(context)!.localeName == 'bn'
                      ? 'banglaName'
                      : AppLocalizations.of(context)!.localeName == 'fi'
                          ? 'finnishName'
                          : 'englishName';
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: DropdownButton<String>(
                  value: state.languageCode,
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.language, color: Colors.deepPurple),
                  underline: SizedBox(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      context.read<QuranBloc>().add(
                            QuranLanguageChangeEvent(
                              languageCode: newValue,
                              language: quranLanguageList.firstWhere((item) =>
                                  item['code'] == newValue)[selectedLanguage]!,
                              quranSurahList: state.quranSurahList,
                            ),
                          );
                    }
                  },
                  items: quranLanguageList
                      .map<DropdownMenuItem<String>>((language) {
                    return DropdownMenuItem<String>(
                      value: language['code'],
                      child: Text(
                        language[selectedLanguage]!,
                      ),
                    );
                  }).toList(),
                ),
              );
            }
            return Center(child: Text('An error has occurred'));
          },
        ),
      ],
    );
  }
}
