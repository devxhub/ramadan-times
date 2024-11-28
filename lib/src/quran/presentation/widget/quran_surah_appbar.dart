import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
  String _selectedLanguage = 'en';
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
            radius: 12.r,
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
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: DropdownButton<String>(
            value: _selectedLanguage,
            dropdownColor: Colors.white,
            icon: Icon(Icons.language, color: Colors.deepPurple),
            underline: SizedBox(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedLanguage = newValue;
                });
              }
            },
            items: quranLanguageList.map<DropdownMenuItem<String>>((language) {
              return DropdownMenuItem<String>(
                value: language['code'],
                child: Text(language['Name']!),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
