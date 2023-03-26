import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hijri/hijri_array.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/src/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:ramadantimes/src/bloc/calendar_bloc/calendar_event.dart';
import 'package:ramadantimes/src/bloc/calendar_bloc/calendar_state.dart';
import 'package:ramadantimes/src/calender/utils.dart';
import 'package:ramadantimes/src/models/calendar_model/datum.dart';
import 'package:ramadantimes/src/models/timing/timings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../l10n/app_localizations.dart';
import '../bloc/location/location_cubit.dart';
import '../bloc/location/location_state.dart';
import '../component/eng_to_bn.dart';
import '../models/address/district.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  // late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  void initState() {
    super.initState();
    context.read<CalendarBloc>().add(CalendarDataFetched(
        isRefreshed: true, country: "Bangladesh", school: 1, method: 1));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    context.read<CalendarBloc>().add(CalendarDaySelected(
          selectedDay: selectedDay,
          focusDay: focusedDay,
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
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: const BoxDecoration(color: Color(0xff6348EB)),
                  child: TableCalendar<Datum>(
                    headerStyle: HeaderStyle(
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
                    // rangeStartDay: _rangeStart,
                    // rangeEndDay: _rangeEnd,
                    calendarFormat: _calendarFormat,
                    // rangeSelectionMode: _rangeSelectionMode,
                    eventLoader: (day) {
                      return state.datum
                              ?.where((element) =>
                                  element.date?.gregorian?.year ==
                                      day.year.toString() &&
                                  element.date?.gregorian?.month?.number ==
                                      day.month &&
                                  element.date?.gregorian?.day ==
                                      day.day.toString())
                              .toList() ??
                          [];
                    },
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
                // const SizedBox(height: 8.0),
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
                          const LocationPicker(),
                          const SizedBox(
                            height: 24,
                          ),
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
                                      AppLocalizations.of(context)!.localeName == "bn"
                                          ? engToBn(AppLocalizations.of(context)
                                                  ?.arabicDate(
                                                      state.selectedEvent?.date
                                                              ?.hijri?.day ??
                                                          "",
                                                      state
                                                              .selectedEvent
                                                              ?.date
                                                              ?.hijri
                                                              ?.month
                                                              ?.number
                                                              .toString() ??
                                                          "",
                                                      state.selectedEvent?.date
                                                              ?.hijri?.year ??
                                                          "") ??
                                              "")
                                          : AppLocalizations.of(context)?.arabicDate(
                                                  state.selectedEvent?.date?.hijri?.day ?? "",
                                                  state.selectedEvent?.date?.hijri?.month?.en.toString() ?? "",
                                                  state.selectedEvent?.date?.hijri?.year ?? "") ??
                                              "",
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
                              // shrinkWrap: true,
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
                                        // bottom: 0,
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
                                          startTime: state
                                              .selectedEvent!.timings!.fajr!,
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
                                              .selectedEvent!.timings!.maghrib!,
                                          adjustTime: 4,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        TimeCard(
                                          name: AppLocalizations.of(context)
                                                  ?.prayerName("Fajr") ??
                                              "",
                                          startTime: state
                                              .selectedEvent!.timings!.fajr!,
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
                                          startTime: state
                                              .selectedEvent!.timings!.dhuhr!,
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
                                          startTime: state
                                              .selectedEvent!.timings!.asr!,
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
                                              .selectedEvent!.timings!.maghrib!,
                                          adjustTime: 0,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        TimeCard(
                                          name: AppLocalizations.of(context)
                                                  ?.prayerName("Isha") ??
                                              "",
                                          startTime: state
                                              .selectedEvent!.timings!.isha!,
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
          } else {
            return const Center(
              child: AutoSizeText("Something went wrong"),
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
                      DateFormat.jm("bn_BD").format(
                        DateTime(
                          2023,
                          1,
                          1,
                          int.parse(startTime.split(":").first),
                          int.parse(startTime.split(":").last.substring(0, 2)),
                        ).add(Duration(minutes: adjustTime ?? 0)),
                      ),
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

class DateCellCustom extends StatelessWidget {
  final Color color;
  final DateTime day;
  final BoxDecoration? boxDecoration;
  const DateCellCustom({
    required this.color,
    required this.day,
    this.boxDecoration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.only(bottom: 6),
        alignment: Alignment.center,
        // padding: EdgeInsets.all(12),
        decoration: boxDecoration ??
            BoxDecoration(shape: BoxShape.circle, color: color),
        child: AutoSizeText(
          day.day.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class LocationPicker extends StatefulWidget {
  const LocationPicker({
    super.key,
  });

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  District? selectedLocation;
  @override
  void initState() {
    context.read<LocationCubit>().loadData();
    setLocation();

    super.initState();
  }

  setLocation() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    District? d = District.fromJson(jsonDecode(
        prefs.getString("current_location") ??
            jsonEncode(District(
                id: "47",
                division_id: "6",
                name: "Dhaka",
                bn_name: "ঢাকা",
                lat: "23.7115253",
                lon: "90.4111451",
                url: "www.dhaka.gov.bd"))));

    // print(d.bn_name);

    selectedLocation = d;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        decoration: BoxDecoration(
          // color: const Color(0xffe3deff),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          // width: MediaQuery.of(context).size.width/2,
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const SizedBox(
                  child: Icon(
                Icons.location_pin,
                size: 18,
              )),
              const SizedBox(
                width: 8,
              ),
              BlocBuilder<LocationCubit, LocationState<List<District>>>(
                builder: (context, state) {
                  return state.when(idle: () {
                    return Container();
                  }, loading: () {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }, data: (data) {
                    return DropdownButton<District>(
                      hint: AutoSizeText(selectedLocation?.bn_name ?? ""),
                      // value: selectedLocation,
                      borderRadius: BorderRadius.circular(12),
                      underline: const SizedBox(),
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      items: data.map(
                        (e) {
                          return DropdownMenuItem(
                              value: e, child: AutoSizeText(e.bn_name));
                        },
                      ).toList(),
                      onChanged: (v) async {
                        setState(() {
                          selectedLocation = v!;
                        });
                        // Obtain shared preferences.
                        final prefs = await SharedPreferences.getInstance();
                        String data = jsonEncode(v);

                        prefs.setString("current_location", data);
                        if (!mounted) return;
                        context.read<CalendarBloc>().add(
                              CalendarDataFetched(
                                city: v!.name,
                                year: DateTime.now().year,
                                month: DateTime.now().month,
                              ),
                            );
                      },
                    );
                  }, error: (e) {
                    return Container();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
