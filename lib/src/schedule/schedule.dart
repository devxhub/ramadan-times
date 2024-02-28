import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';

import 'package:ramadantimes/src/bloc/home/bloc/calendar_bloc.dart';
import 'package:ramadantimes/src/bloc/home/bloc/calendar_event.dart';


import 'package:ramadantimes/src/models/address/district.dart';

import 'package:ramadantimes/src/schedule/time_of_ifter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/home/bloc/calendar_state.dart';

import 'dua.dart';
import 'location_picker.dart';
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
        backgroundColor: const Color(0xfff2f2ef),
        elevation: 0,
        actions: const [
          LocationPicker(),
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
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, HomeState state) {
            if (state.status == HomeStatus.initial) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state.status == HomeStatus.success) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(height: 16.spMin),
                    ),
                    SliverToBoxAdapter(
                      child: TodayInfoCard(
                        timeOfToday: state.timeOfToday!,
                        timeOfNextDay: state.timeOfNextDay!,
                        weatherMap: state.weatherData!,
                      ),
                    ),
                    if (state.timeOfToday != null)
                      SliverToBoxAdapter(
                        child: NextPrayer(
                          today: state.timeOfToday!,
                          nextDay: state.timeOfNextDay!,
                        ),
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
                            time: state.timeOfToday?.data?.timings?.fajr ?? "",
                          ),
                          RemainingTimeContainerForSehriTime(
                            sehriTime:
                                state.timeOfToday?.data?.timings?.fajr ?? "",
                          ),
                          TimeContainerForIftarTime(
                            ifterTime:
                                state.timeOfToday?.data?.timings?.sunset ?? "",
                          ),
                          RemainingTimeContainerForIftarTime(
                            ifterTime:
                                state.timeOfToday?.data?.timings?.sunset ?? "",
                          ),
                        ],
                      ),
                    ),
                    if (state.timeOfNextDay != null)
                      SliverToBoxAdapter(
                        child: NextSehriIftar(
                          data: state.timeOfNextDay!,
                        ),
                      ),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 24),
                    ),
                    const SliverToBoxAdapter(
                      child: Dua(),
                    ),
                     SliverToBoxAdapter(
                      child: SizedBox(height: MediaQuery.of(context).viewPadding.bottom + 80.sp),
                    ),
                  ],
                ),
              );
            } else if (state.status == HomeStatus.noData) {
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
