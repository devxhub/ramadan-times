import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgen_button/nextgen_button.dart';
import 'package:ramadantimes/src/component/eng_to_bn.dart';
import 'package:ramadantimes/src/prayer_times/data/models/manual_prayer_time.dart';
import 'package:ramadantimes/src/prayer_times/presentation/bloc/prayer_time_bloc.dart';
import 'package:wheel_slider/wheel_slider.dart';

import '../../../../l10n/app_localizations.dart';

class ManualCorrectionsScreen extends StatefulWidget {
  const ManualCorrectionsScreen({super.key});

  @override
  State<ManualCorrectionsScreen> createState() =>
      _ManualCorrectionsScreenState();
}

class _ManualCorrectionsScreenState extends State<ManualCorrectionsScreen> {
  int currentVal = 0;
  late FixedExtentScrollController scrollController;
  ManualPrayerTime manualPrayerTime = ManualPrayerTime();
  @override
  void initState() {
    super.initState();
    // Initialize the scroll controller to start at 0
    scrollController = FixedExtentScrollController(initialItem: 0);
  }

  @override
  void dispose() {
    // Dispose of the scroll controller to avoid memory leaks
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.manualCorrection),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Card(
                    elevation: 4,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showSliderDialog(
                                  context,
                                  state.manualPrayerTime.manualFajrTime ?? 0,
                                  'Fajr');
                            },
                            child: ListTile(
                              title: Text(
                                AppLocalizations.of(context)?.fajr ?? '',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.sp),
                              ),
                              subtitle: Text(
                                engToBn(
                                    state.manualPrayerTime.manualFajrTime
                                        .toString(),
                                    context),
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12.sp),
                              ),
                            ),
                          ),
                          Divider(color: Colors.black, height: 1.h),
                          GestureDetector(
                            onTap: () {
                              showSliderDialog(
                                  context,
                                  state.manualPrayerTime.manualSunriseTime ?? 0,
                                  'Sunrise');
                            },
                            child: ListTile(
                              title: Text(
                                AppLocalizations.of(context)?.sunRise ?? '',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.sp),
                              ),
                              subtitle: Text(
                                engToBn(
                                    state.manualPrayerTime.manualSunriseTime
                                        .toString(),
                                    context),
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12.sp),
                              ),
                            ),
                          ),
                          Divider(color: Colors.black, height: 1),
                          GestureDetector(
                            onTap: () {
                              showSliderDialog(
                                  context,
                                  state.manualPrayerTime.manualDhuhrTime ?? 0,
                                  'Dhuhr');
                            },
                            child: ListTile(
                              title: Text(
                                AppLocalizations.of(context)?.dhuhr ?? '',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.sp),
                              ),
                              subtitle: Text(
                                engToBn(
                                    state.manualPrayerTime.manualDhuhrTime
                                        .toString(),
                                    context),
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12.sp),
                              ),
                            ),
                          ),
                          Divider(color: Colors.black, height: 1),
                          GestureDetector(
                            onTap: () {
                              showSliderDialog(
                                  context,
                                  state.manualPrayerTime.manualAsrTime ?? 0,
                                  'Asr');
                            },
                            child: ListTile(
                              title: Text(
                                AppLocalizations.of(context)?.asr ?? '',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.sp),
                              ),
                              subtitle: Text(
                                engToBn(
                                    state.manualPrayerTime.manualAsrTime
                                        .toString(),
                                    context),
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12.sp),
                              ),
                            ),
                          ),
                          Divider(color: Colors.black, height: 1),
                          GestureDetector(
                            onTap: () {
                              showSliderDialog(
                                  context,
                                  state.manualPrayerTime.manualMaghribTime ?? 0,
                                  'Maghrib');
                            },
                            child: ListTile(
                              title: Text(
                                AppLocalizations.of(context)?.maghrib ?? '',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.sp),
                              ),
                              subtitle: Text(
                                engToBn(
                                    state.manualPrayerTime.manualMaghribTime
                                        .toString(),
                                    context),
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12.sp),
                              ),
                            ),
                          ),
                          Divider(color: Colors.black, height: 1),
                          GestureDetector(
                            onTap: () {
                              showSliderDialog(
                                  context,
                                  state.manualPrayerTime.manualIshaTime ?? 0,
                                  "Isha");
                            },
                            child: ListTile(
                              title: Text(
                                AppLocalizations.of(context)?.isha ?? '',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.sp),
                              ),
                              subtitle: Text(
                                engToBn(
                                    (state.manualPrayerTime.manualIshaTime
                                            .toString()) ??
                                        "0",
                                    context),
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 32.h,
              ),
              NextGenButton(
                onTap: () {
                  context
                      .read<PrayerTimeBloc>()
                      .add(PrayerTimeEvent.resetManualPrayerTime());
                },
                color: const Color(0xff674cec), // Set the background color
                borderColor: Colors.transparent, // No border
                height: 40.h, // Adjust the height of the button
                width: 330.w, // Adjust the width of the button
                radius: 8.0, // Optional: Add corner radius
                isLoading: state.prayerTimeStatus ==
                    PrayerTimeStatus.initial, // Show loading indicator
                titleText: Text(
                  AppLocalizations.of(context)?.resetTime ?? '',
                  style: TextStyle(
                    fontSize: 16.w,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void showSliderDialog(
      BuildContext context, int initialValue, String prayerName) {
    final FixedExtentScrollController scrollController =
        FixedExtentScrollController(
            initialItem: initialValue + 59); // Map initial value to index
    int selectedValue = initialValue;
    context
        .read<PrayerTimeBloc>()
        .add(PrayerTimeEvent.selectedTimeUpdate(time: initialValue));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
              builder: (context, state) {
                return AlertDialog(
                  title: Text(
                    AppLocalizations.of(context)!.manualCorrection,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 150,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 50, // Align with the center item
                              left: 0,
                              right:
                                  0, // Add constraints to prevent infinite width
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                ),
                              ),
                            ),
                            ListWheelScrollView.useDelegate(
                              controller: scrollController,
                              physics: const FixedExtentScrollPhysics(),
                              diameterRatio: 1.2,
                              itemExtent: 50,
                              onSelectedItemChanged: (index) {
                                context.read<PrayerTimeBloc>().add(
                                    PrayerTimeEvent.onchangeTimeSelected(
                                        onchangeTime: index - 59));
                              },
                              childDelegate: ListWheelChildBuilderDelegate(
                                builder: (context, index) {
                                  final value = index - 59;
                                  final isSelected =
                                      value == state.selectedTime;

                                  return Center(
                                    child: AnimatedDefaultTextStyle(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      style: TextStyle(
                                        fontSize: isSelected ? 20 : 16,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isSelected
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                      child: Text(
                                          '${engToBn(value.toString(), context)} ${AppLocalizations.of(context)?.minute}${AppLocalizations.of(context)!.localeName == "en" && value == 1 || value == 0 || value == -1 ? "" : "s"}'),
                                    ),
                                  );
                                },
                                childCount: 119, // Total range: -59 to +59
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${AppLocalizations.of(context)?.selectedTime}: ${engToBn(state.selectedTime.toString(), context)} ${AppLocalizations.of(context)?.minute}${AppLocalizations.of(context)!.localeName == "en" && state.selectedTime == 1 || state.selectedTime == 0 || state.selectedTime == -1 ? "" : "s"}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(AppLocalizations.of(context)?.cancel ?? ""),
                    ),
                    TextButton(
                      onPressed: () {
                        manualPrayerTime = ManualPrayerTime(
                          manualFajrTime: prayerName.toLowerCase() == 'fajr'
                              ? state.selectedTime
                              : state.manualPrayerTime.manualFajrTime,
                          manualSunriseTime:
                              prayerName.toLowerCase() == 'sunrise'
                                  ? state.selectedTime
                                  : state.manualPrayerTime.manualSunriseTime,
                          manualDhuhrTime: prayerName.toLowerCase() == 'dhuhr'
                              ? state.selectedTime
                              : state.manualPrayerTime.manualDhuhrTime,
                          manualAsrTime: prayerName.toLowerCase() == 'asr'
                              ? state.selectedTime
                              : state.manualPrayerTime.manualAsrTime,
                          manualMaghribTime:
                              prayerName.toLowerCase() == 'maghrib'
                                  ? state.selectedTime
                                  : state.manualPrayerTime.manualMaghribTime,
                          manualIshaTime: prayerName.toLowerCase() == 'isha'
                              ? state.selectedTime
                              : state.manualPrayerTime.manualIshaTime,
                        );
                        context.read<PrayerTimeBloc>().add(
                            PrayerTimeEvent.manuallyPrayerTimeChange(
                                manualPrayerTime: manualPrayerTime,
                                prayerName: prayerName));
                        //  onValueSelected(selectedValue); // Pass the selected value
                        Navigator.of(context).pop();
                      },
                      child: Text(AppLocalizations.of(context)?.done ?? ""),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
