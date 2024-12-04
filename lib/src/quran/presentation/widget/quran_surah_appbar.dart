import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ramadantimes/src/quran/presentation/bloc/quran_bloc.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/repository/quran_language_data.dart';

class QuranSurahAppBar extends StatefulWidget implements PreferredSizeWidget {
  const QuranSurahAppBar({super.key});

  @override
  _QuranSurahAppBarState createState() => _QuranSurahAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _QuranSurahAppBarState extends State<QuranSurahAppBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    context.read<QuranBloc>().add(QuranSearchEvent(_searchController.text));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Gap(10.w),
              InkWell(
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
              Gap(10.w),
              Text(
                AppLocalizations.of(context)!.quran,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              Spacer(),
              BlocBuilder<QuranBloc, QuranState>(
                builder: (context, state) {
                  if (state is QuranLoaded) {
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
                                    language: quranLanguageList.firstWhere(
                                        (item) =>
                                            item['code'] == newValue)['Name']!,
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
                              language['Name']!,
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                  return Center(child: Text('An error has occurred'));
                },
              ),
              Gap(10.w),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Surah...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
