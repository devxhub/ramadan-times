import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/src/bloc/home/bloc/calendar_bloc.dart';
import 'package:ramadantimes/src/bloc/home/bloc/calendar_event.dart';
import 'package:ramadantimes/src/models/address/district.dart';
import 'package:ramadantimes/src/prayer_times/presentation/bloc/prayer_time_bloc.dart';
import 'package:ramadantimes/src/prayer_times/presentation/pages/prayer_time_widget.dart';
import 'package:ramadantimes/src/prayer_times/presentation/widgets/user_location.dart';
import 'package:ramadantimes/src/prayer_times/presentation/widgets/user_location.dart';

import 'package:ramadantimes/src/schedule/time_of_ifter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/home/bloc/calendar_state.dart';
import 'dua.dart';
import 'next_prayer.dart';
import 'next_sehri_ifter.dart';
import 'remaining_time_for_ifter.dart';
import 'remaining_time_for_sehri.dart';
import 'time_info_card.dart';
import 'time_of_sehri.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  bool setReminderForIftar = true;
  District? selectedLocation;
  @override
  void initState() {
    context.read<HomeBloc>().add(DataFetched(
            date: DateFormat("dd-MM-yyyy").format(
          DateTime.now(),
        )));
    //context.read<PrayerTimeBloc>().add(PrayerTimeEvent.prayerTimesDataLoaded(latitude: 23.7115253,longitude:90.4111451, ));
    context.read<PrayerTimeBloc>().add(PrayerTimeEvent.countryDataLoaded());
    context
        .read<PrayerTimeBloc>()
        .add(PrayerTimeEvent.locationPermission(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Intl.defaultLocale = 'es';

    return Scaffold(
      // primary: false,
      backgroundColor: const Color(0xfff2f2ef),
      appBar: AppBar(
        primary: true,
        foregroundColor: Colors.black,
        backgroundColor: Color(0xfff2f2ef),
        elevation: 0,
        actions: const [
          // LocationPicker(),
          UserLocation()
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          if (!mounted) return;
          context.read<HomeBloc>().add(
                DataFetched(
                    date: DateFormat("dd-MM-yyyy").format(
                      DateTime.now(),
                    ),
                    city: District.fromJson(jsonDecode(
                            preferences.getString("current_location")!))
                        .bn_name),
              );
        },
        child: BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
          builder: (context, state) {
            if (state.prayerStatus == PrayerStatus.initial ||
                state.prayerTimesResponse.fajrStart == null) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state.prayerStatus == PrayerStatus.success) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomScrollView(slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(height: 16.spMin),
                  ),
                  SliverToBoxAdapter(
                    child: TodayInfoCard(
                      timeOfToday: state.prayerTimesResponse,
                      timeOfNextDay: state.prayerTimesResponseNextDay,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: NextPrayer(
                      today: state.prayerTimesResponse,
                      nextDay: state.prayerTimesResponseNextDay,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: PrayerTimeWidget(),
                  ),
                  SliverToBoxAdapter(
                    child: GridView(
                      padding: EdgeInsets.only(top: 24.spMin),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 12),
                      children: [
                        TimeContainerForSehriTime(
                          time: state.prayerTimesResponse.fajrStart ?? "",
                        ),
                        RemainingTimeContainerForSehriTime(
                          sehriTime: state.prayerTimesResponse.fajrStart ?? "",
                        ),
                        TimeContainerForIftarTime(
                          ifterTime:
                              state.prayerTimesResponse.maghribStart ?? "",
                        ),
                        RemainingTimeContainerForIftarTime(
                          ifterTime:
                              state.prayerTimesResponse.maghribStart ?? "",
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: NextSehriIftar(
                      data: state.prayerTimesResponseNextDay,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 24),
                  ),
                  const SliverToBoxAdapter(
                    child: Dua(),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 200),
                  )
                ]),
              );
            } else if (state.prayerStatus == PrayerStatus.failure) {
              // showDialog(context: context, builder: (context) => const AlertDialog(
              // content: Text("Please Connect to the internet "),
              // ),);
              return SizedBox(
                height: 900.h,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/nowifi.png",
                        fit: BoxFit.cover,
                        height: 300.h,
                        width: 300.h,
                      ),
                      AutoSizeText(
                        "Please connect to the internet!!!",
                        style: TextStyle(fontSize: 24.sp),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return SizedBox(
                height: 900.h,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/error.png",
                        fit: BoxFit.cover,
                        height: 300.h,
                        width: 300.h,
                      ),
                      AutoSizeText(
                        "Something went wrong...",
                        style: TextStyle(fontSize: 24.sp),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
