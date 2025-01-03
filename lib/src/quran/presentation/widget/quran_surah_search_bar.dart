import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../l10n/app_localizations.dart';

class QuranSurahSearchBar extends StatelessWidget {
  const QuranSurahSearchBar({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h, bottom: 2.h),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.searchSurah,
          hintStyle: TextStyle(fontSize: 13.sp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0.r),
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 15.sp,
          ),
        ),
      ),
    );
  }
}
