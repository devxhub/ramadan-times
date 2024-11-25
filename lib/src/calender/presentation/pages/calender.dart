import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/src/calender/presentation/bloc/calendar_bloc.dart';
import 'package:ramadantimes/src/calender/presentation/bloc/calendar_event.dart';
import 'package:ramadantimes/src/calender/presentation/bloc/calendar_state.dart';
import 'package:ramadantimes/src/calender/utils.dart';
import 'package:ramadantimes/src/models/calendar_model/datum.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../l10n/app_localizations.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  void initState() {
    super.initState();
    // context.read<CalendarBloc>().add(CalendarDataFetched(
    //     isRefreshed: true, country: "Bangladesh", school: 1, method: 1));
    context.read<CalendarBloc>().add(CalendarDaySelected(
          selectedDay: DateTime.now(),
          focusDay: DateTime.now(),
          latitude: 23.7115253,
          longitude: 90.4111451,
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    context.read<CalendarBloc>().add(CalendarDaySelected(
          selectedDay: selectedDay,
          focusDay: focusedDay,
          latitude: 23.7115253,
          longitude: 90.4111451,
        ));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: const Color(0xff6348EB),
        title: Text(
          AppLocalizations.of(context)?.calendar ?? "",
        ),
      ),
      body: BlocBuilder<CalendarBloc, CalendarState>(
        builder: (context, state) {
          if (state.status == CalendarStatus.initial) {
            // print("init state");
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state.status == CalendarStatus.success) {
            var hijriDate = HijriCalendar.fromDate(state.selectedEvent!.date!);
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: const BoxDecoration(color: Color(0xff6348EB)),
                  child: TableCalendar<Datum>(
                    calendarBuilders: CalendarBuilders(
                      headerTitleBuilder:
                          (BuildContext context, DateTime dateTime) {
                        return Row(
                          children: [
                            Text(
                              DateFormat('MMMM  yyyy', 'bn_bd')
                                  .format(dateTime),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    //height: 1,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                if (_calendarFormat == CalendarFormat.month) {
                                  setState(() {
                                    _calendarFormat = CalendarFormat.twoWeeks;
                                  });
                                } else if (_calendarFormat ==
                                    CalendarFormat.twoWeeks) {
                                  setState(() {
                                    _calendarFormat = CalendarFormat.week;
                                  });
                                } else {
                                  setState(() {
                                    _calendarFormat = CalendarFormat.month;
                                  });
                                }
                              },
                              child: Container(
                                height: 32,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(color: Colors.white70)),
                                child: Text(
                                  _calendarFormat == CalendarFormat.month
                                      ? "মাস"
                                      : _calendarFormat ==
                                              CalendarFormat.twoWeeks
                                          ? "২ সপ্তাহ"
                                          : "সপ্তাহ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      defaultBuilder: (BuildContext context, DateTime dateTime,
                          DateTime dateTime2) {
                        return Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent),
                          child: Text(
                            DateFormat('dd', 'bn_bd').format(dateTime),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                          ),
                        );
                      },
                      todayBuilder: (BuildContext context, DateTime dateTime,
                          DateTime dateTime2) {
                        return Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white54),
                          child: Text(
                            DateFormat('dd', 'bn_bd').format(dateTime),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                          ),
                        );
                      },
                      selectedBuilder: (BuildContext context, DateTime dateTime,
                          DateTime dateTime2) {
                        return Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Text(
                            DateFormat('dd', 'bn_bd').format(dateTime),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  // height: 1,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                          ),
                        );
                      },
                      outsideBuilder: (BuildContext context, DateTime dateTime,
                          DateTime dateTime2) {
                        return Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent),
                          child: Text(
                            DateFormat('dd', 'bn_bd').format(dateTime),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                          ),
                        );
                      },
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      headerMargin: EdgeInsets.zero,
                      headerPadding: EdgeInsets.zero,
                      leftChevronIcon: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(4)),
                        child: Icon(
                          Icons.chevron_left,
                          size: 32.sp,
                          color: Colors.white,
                        ),
                      ),
                      rightChevronIcon: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(4)),
                        child: Icon(
                          Icons.chevron_right,
                          size: 32.sp,
                          color: Colors.white,
                        ),
                      ),
                      formatButtonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.r),
                          border: Border.all(color: Colors.white60)),
                      formatButtonTextStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                      titleTextStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white, fontSize: 20.sp),
                    ),
                    firstDay: kFirstDay,
                    lastDay: kLastDay,
                    locale: "bn_BD",
                    daysOfWeekStyle: DaysOfWeekStyle(
                        weekendStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white70),
                        weekdayStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white70)),
                    daysOfWeekHeight: 32.spMin,
                    // pageJumpingEnabled: true,
                    focusedDay: state.focusDay ?? DateTime.now(),
                    selectedDayPredicate: (day) =>
                        isSameDay(day, state.selectedDay),
                    calendarFormat: _calendarFormat,
                    startingDayOfWeek: StartingDayOfWeek.friday,
                    calendarStyle: CalendarStyle(
                        selectedTextStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: const Color(0xff6348EB)),
                        selectedDecoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        markerSize: 0,
                        outsideTextStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white12),
                        weekendTextStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                        holidayTextStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                        defaultTextStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                        todayTextStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                        todayDecoration: const BoxDecoration(
                            color: Color(0xffFFB82C), shape: BoxShape.circle),
                        holidayDecoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        defaultDecoration: const BoxDecoration(
                            color: Colors.transparent, shape: BoxShape.circle)),
                    onDaySelected: _onDaySelected,
                    // onRangeSelected: _onRangeSelected,
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      state.focusDay = focusedDay;
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xff6348EB)),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      padding:
                          const EdgeInsets.only(top: 48, left: 24, right: 24),
                      decoration: BoxDecoration(
                          color: const Color(0xfff7f5ff),
                          borderRadius: BorderRadius.circular(48)),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 6),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/Design-2.png",
                                  height: 60,
                                  width: 32,
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      AppLocalizations.of(context)?.hijriDate ??
                                          "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                    ),
                                    AutoSizeText(
                                      "${hijriDate.hDay} ${hijriDate.longMonthName} ${hijriDate.hYear}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            height: 1.4,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: const Color(0xff75718B),
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                AutoSizeText(
                                  AppLocalizations.of(context)?.schedule ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontSize: 24,
                                        color: Colors.black87,
                                      ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                        top: 45,
                                        left: 10,
                                        child: Column(
                                          children: List.generate(
                                              43,
                                              (index) => Column(
                                                    children: [
                                                      Container(
                                                        height: 6,
                                                        width: 2,
                                                        color: Colors.white,
                                                      ),
                                                      Container(
                                                        height: 6,
                                                        width: 2,
                                                        color: Colors.grey,
                                                      ),
                                                    ],
                                                  )),
                                        )),
                                    Column(
                                      children: [
                                        TimeCard(
                                          name: AppLocalizations.of(context)
                                                  ?.sehri ??
                                              "",
                                          startTime:
                                              state.selectedEvent!.fajrStart!,
                                          adjustTime: -5,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        TimeCard(
                                          icon: "assets/images/sun.png",
                                          name: AppLocalizations.of(context)
                                                  ?.ifter ??
                                              "",
                                          startTime: state
                                              .selectedEvent!.maghribStart!,
                                          adjustTime: 4,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        TimeCard(
                                          name: AppLocalizations.of(context)
                                                  ?.prayerName("Fajr") ??
                                              "",
                                          startTime:
                                              state.selectedEvent!.fajrStart!,
                                          adjustTime: 0,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        TimeCard(
                                          icon: "assets/images/sun1.png",
                                          name: AppLocalizations.of(context)
                                                  ?.prayerName("Dhuhr") ??
                                              "",
                                          startTime:
                                              state.selectedEvent!.dhuhrStart!,
                                          adjustTime: 0,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        TimeCard(
                                          icon: "assets/images/sun1.png",
                                          name: AppLocalizations.of(context)
                                                  ?.prayerName("Asr") ??
                                              "",
                                          startTime:
                                              state.selectedEvent!.asrStart!,
                                          adjustTime: 0,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        TimeCard(
                                          icon: "assets/images/sun.png",
                                          name: AppLocalizations.of(context)
                                                  ?.prayerName("Maghrib") ??
                                              "",
                                          startTime: state
                                              .selectedEvent!.maghribStart!,
                                          adjustTime: 0,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        TimeCard(
                                          name: AppLocalizations.of(context)
                                                  ?.prayerName("Isha") ??
                                              "",
                                          startTime:
                                              state.selectedEvent!.ishaStart!,
                                          adjustTime: 0,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state.status == CalendarStatus.noData) {
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
                      height: 250.h,
                      width: 250.h,
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
    );
  }
}

class TimeCard extends StatelessWidget {
  const TimeCard({
    super.key,
    required this.startTime,
    this.endTime,
    this.adjustTime = 0,
    required this.name,
    this.icon,
  });
  final String name;
  final String? icon;
  final String startTime;
  final String? endTime;
  final int? adjustTime;

  @override
  Widget build(BuildContext context) {
    String formatTime(String utcTime, {int adjustTime = 0}) {
      DateTime utcDateTime = DateTime.parse(utcTime);
      DateTime adjustedDateTime =
          utcDateTime.add(Duration(minutes: adjustTime));
      return DateFormat.jm("bn_BD").format(adjustedDateTime);
    }

    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
                width: 5,
                color: const Color(
                  0xffFFB82C,
                )),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  icon ?? "assets/images/moon1.png",
                  height: 60,
                  width: 32,
                ),
                const SizedBox(
                  width: 24,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      name,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                    ),
                    AutoSizeText(
                      formatTime(startTime),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            height: 1,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: const Color(0xff75718B),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
