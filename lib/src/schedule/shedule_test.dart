// import 'dart:convert';
//
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'package:intl/intl.dart';
//
// import 'package:muslimtimespro/src/bloc/home/bloc/calendar_bloc.dart';
// import 'package:muslimtimespro/src/bloc/home/bloc/calendar_event.dart';
// import 'package:muslimtimespro/src/dbHelper/db_helper_bloc/prayer_times_bloc.dart';
//
// import 'package:muslimtimespro/src/models/address/district.dart';
//
// import 'package:muslimtimespro/src/schedule/time_of_ifter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../bloc/home/bloc/calendar_state.dart';
//
// import 'dua.dart';
// import 'location_picker.dart';
// import 'next_prayer.dart';
// import 'next_sehri_ifter.dart';
// import 'remaining_time_for_ifter.dart';
// import 'remaining_time_for_sehri.dart';
// import 'time_info_card.dart';
// import 'time_of_sehri.dart';
//
// class SchedulePage extends StatefulWidget {
//   const SchedulePage({super.key});
//
//   @override
//   State<SchedulePage> createState() => _SchedulePageState();
// }
//
// class _SchedulePageState extends State<SchedulePage> {
//   bool setReminderForIftar = true;
//   District? selectedLocation;
//   @override
//   void initState() {
//     context.read<HomeBloc>().add(DataFetched(
//         date: DateFormat("dd-MM-yyyy").format(
//           DateTime.now(),
//         )));
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Intl.defaultLocale = 'es';
//
//     return Scaffold(
//       // primary: false,
//       backgroundColor: const Color(0xfff2f2ef),
//       appBar: AppBar(
//         primary: true,
//         foregroundColor: Colors.black,
//         backgroundColor: Color(0xfff2f2ef),
//         elevation: 0,
//         actions: const [
//           LocationPicker(),
//         ],
//       ),
//       body: RefreshIndicator(
//         onRefresh: () async {
//           SharedPreferences preferences = await SharedPreferences.getInstance();
//           if (!mounted) return;
//           context.read<HomeBloc>().add(
//             DataFetched(
//                 date: DateFormat("dd-MM-yyyy").format(
//                   DateTime.now(),
//                 ),
//                 city: District.fromJson(jsonDecode(
//                     preferences.getString("current_location")!))
//                     .bn_name),
//           );
//         },
//         child: BlocBuilder<HomeBloc, HomeState>(
//           builder: (context, HomeState state) {
//             if (state.status == HomeStatus.initial) {
//               return BlocBuilder<PrayerTimesBloc, PrayerTimesState>(
//                 builder: (context,state) {
//                   if (state is PrayerTimesLoading) {
//                     return Center(child: CircularProgressIndicator());
//                   }
//                   else if(state is PrayerTimesLoaded){
//                     return ListView.builder(
//                         itemCount: state.prayerTimesData.length,
//                         itemBuilder: (context,index){
//                           final prayerTime = state.prayerTimesData[index];
//                           return ListTile(
//                             title: Text(prayerTime.date),
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('Fajr: ${prayerTime.fajr}'),
//                                 Text('Dhuhr: ${prayerTime.dhuhr}'),
//                                 Text('Asr: ${prayerTime.asr}'),
//                                 Text('Maghrib: ${prayerTime.maghrib}'),
//                                 Text('Isha: ${prayerTime.isha}'),
//                               ],
//                             ),
//
//                           );
//                         }
//                     );
//                   }
//                 },
//               );
//             } else if (state.status == HomeStatus.success) {
//               return Container(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w),
//                 child: CustomScrollView(slivers: [
//                   SliverToBoxAdapter(
//                     child: SizedBox(height: 16.spMin),
//                   ),
//                   SliverToBoxAdapter(
//                     child: TodayInfoCard(
//                       timeOfToday: state.timeOfToday!,
//                       timeOfNextDay: state.timeOfNextDay!,
//                     ),
//                   ),
//                   if (state.timeOfToday != null)
//                     SliverToBoxAdapter(
//                       child: NextPrayer(
//                         today: state.timeOfToday!,
//                         nextDay: state.timeOfNextDay!,
//                       ),
//                     ),
//                   SliverToBoxAdapter(
//                     child: GridView(
//                       padding: EdgeInsets.only(top: 24.spMin),
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           childAspectRatio: 1.1,
//                           crossAxisSpacing: 12.w,
//                           mainAxisSpacing: 12),
//                       children: [
//                         TimeContainerForSehriTime(
//                           time: state.timeOfToday?.data?.timings?.fajr ?? "",
//                         ),
//                         RemainingTimeContainerForSehriTime(
//                           sehriTime:
//                           state.timeOfToday?.data?.timings?.fajr ?? "",
//                         ),
//                         TimeContainerForIftarTime(
//                           ifterTime:
//                           state.timeOfToday?.data?.timings?.sunset ?? "",
//                         ),
//                         RemainingTimeContainerForIftarTime(
//                           ifterTime:
//                           state.timeOfToday?.data?.timings?.sunset ?? "",
//                         ),
//                       ],
//                     ),
//                   ),
//                   if (state.timeOfNextDay != null)
//                     SliverToBoxAdapter(
//                       child: NextSehriIftar(
//                         data: state.timeOfNextDay!,
//                       ),
//                     ),
//                   const SliverToBoxAdapter(
//                     child: SizedBox(height: 24),
//                   ),
//                   const SliverToBoxAdapter(
//                     child: Dua(),
//                   ),
//                   const SliverToBoxAdapter(
//                     child: SizedBox(height: 200),
//                   )
//                 ]),
//               );
//             } else {
//               return SizedBox(
//                 height: 900.h,
//                 child: const Center(
//                   child: AutoSizeText("Something went Wrong"),
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
