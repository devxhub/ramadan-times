import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramadantimes/src/services/responsive_service.dart';

import '../../l10n/app_localizations.dart';

class Dua extends StatefulWidget {
  const Dua({
    super.key,
  });

  @override
  State<Dua> createState() => _DuaState();
}

class _DuaState extends State<Dua> with TickerProviderStateMixin {
  // late TabController _tabController;

  @override
  void initState() {
    // _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> duaList = [
      Container(
        // constraints: BoxConstraints.loose(Size(300, 100)),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          children: [
            Text(
              "نَوَيْتُ اَنْ اُصُوْمَ غَدًا مِّنْ شَهْرِ رَمْضَانَ الْمُبَارَكِ فَرْضَا لَكَ يَا اللهُ فَتَقَبَّل مِنِّى اِنَّكَ اَنْتَ السَّمِيْعُ الْعَلِيْم",
              style: GoogleFonts.amiri(
                height: isLargeScreen ? 2 : 1,
                fontSize: isLargeScreen ? 13.sp : 8.5.sp,
              ),
              textAlign: TextAlign.right,
            ),
            Text(
              "উচ্চারণ : নাওয়াইতু আন আছুমা গদাম মিং শাহরি রমাদ্বানাল মুবারকি ফারদ্বল্লাকা ইয়া আল্লাহু ফাতাক্বব্বাল মিন্নী ইন্নাকা আংতাস সামীউল আলীম",
              textAlign: TextAlign.justify,
              style: GoogleFonts.amiri(
                fontSize: isLargeScreen ? 13.sp : 8.5.sp,
              ),
            ),
            Text(
              "অর্থ : হে আল্লাহ! আমি আগামীকাল পবিত্র রমজানের তোমার পক্ষ থেকে নির্ধারিত ফরজ রোজা রাখার ইচ্ছা পোষণ (নিয়্যত) করলাম। অতএব তুমি আমার পক্ষ থেকে (আমার রোযা তথা পানাহার থেকে বিরত থাকাকে) কবুল কর, নিশ্চয়ই তুমি সর্বশ্রোতা ও সর্বজ্ঞানী।",
              textAlign: TextAlign.justify,
              style: GoogleFonts.amiri(
                fontSize: 8.5.sp,
              ),
            ),
          ],
        ),
      ),
      Container(
        // constraints: BoxConstraints.loose(Size(300, 100)),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          children: [
            Text(
              "اَللَّهُمَّ لَكَ صُمْتُ وَ عَلَى رِزْقِكَ وَ اَفْطَرْتُ بِرَحْمَتِكَ يَا اَرْحَمَ الرَّاحِيْمِيْن",
              textAlign: TextAlign.right,
              style: GoogleFonts.amiri(
                height: isLargeScreen ? 2 : 1,
                fontSize: isLargeScreen ? 13.sp : 8.5.sp,
              ),
            ),
            Text(
              "উচ্চারণ : আল্লাহুম্মা লাকা ছুমতু ওয়া আলা রিযক্বিকা ওয়া আফতারতু বিরাহমাতিকা ইয়া আরহামার রাহিমিন",
              textAlign: TextAlign.justify,
              style: GoogleFonts.amiri(
                fontSize: isLargeScreen ? 13.sp : 8.5.sp,
              ),
            ),
            Text(
              "অর্থ : হে আল্লাহ! আমি তোমারই সন্তুষ্টির জন্য রোজা রেখেছি এবং তোমারই দেয়া রিযিক্বের মাধ্যমে ইফতার করছি।",
              textAlign: TextAlign.justify,
              style: GoogleFonts.amiri(
                fontSize: isLargeScreen ? 13.sp : 8.5.sp,
              ),
            ),
          ],
        ),
      ),
    ];

    return Container(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      // height: ,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          const Color(0xff6348EB),
          const Color(0xff6348EB).withOpacity(0),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        color: const Color(0xff6348eb),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6),
              // width: 200,
              // height: 48,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                // controller: _tabController,
                // indicatorSize: TabBarIndicatorSize.tab,
                // labelColor: const Color(0xff6348eb),
                // unselectedLabelColor: Colors.white,
                // indicator: const BoxDecoration(color: Colors.transparent),
                // labelPadding: EdgeInsets.zero,
                // onTap: (value) {
                //   setState(() {
                //     _selectedTab = value;
                //   });
                // },
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTab = 0;
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: _selectedTab == 0
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: Text(
                          AppLocalizations.of(context)?.sehriDua ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: _selectedTab == 0
                                      ? const Color(0xff6348EB)
                                      : Colors.white),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTab = 1;
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: _selectedTab == 1 ? Colors.white : null,
                        ),
                        child: Text(
                          AppLocalizations.of(context)?.ifterDua ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: _selectedTab == 1
                                      ? const Color(0xff6348EB)
                                      : Colors.white),
                        )),
                  ),
                ],
              )),
          SizedBox(
            height: 16.spMin,
          ),
          duaList[_selectedTab],
        ],
      ),
    );
  }
}
