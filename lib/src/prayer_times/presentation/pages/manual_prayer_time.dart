import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadantimes/src/prayer_times/data/models/manual_prayer_time.dart';
import 'package:ramadantimes/src/prayer_times/presentation/bloc/prayer_time_bloc.dart';
import 'package:wheel_slider/wheel_slider.dart';

class ManualCorrectionsScreen extends StatefulWidget {
  @override
  State<ManualCorrectionsScreen> createState() => _ManualCorrectionsScreenState();
}

class _ManualCorrectionsScreenState extends State<ManualCorrectionsScreen> {
  int currentVal=0;
  late FixedExtentScrollController scrollController;
ManualPrayerTime manualPrayerTime=ManualPrayerTime();
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
      appBar: AppBar(
        title: Text('Manual corrections'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
  builder: (context, state) {
    return Padding(
        padding:  EdgeInsets.all(8.sp),
        child: Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          color: Colors.white,
          child: SizedBox(
            height: 385.h,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showSliderDialog(context,state.manualPrayerTime.manualFajrTime??0,'Fajr');
                    },
                    child: ListTile(
                      title: Text(
                        'Fajr',
                        style: TextStyle(color: Colors.black,fontSize: 16.sp),
                      ),
                      subtitle: Text(
                        "${state.manualPrayerTime.manualFajrTime??0}",
                        style: TextStyle(color: Colors.black54,fontSize: 12.sp),
                      ),
                    ),
                  ),
                  Divider(color: Colors.black, height: 1),
                  GestureDetector(
                    onTap: () {
                      showSliderDialog(context,state.manualPrayerTime.manualSunriseTime??0,'Sunrise');
                    },
                    child: ListTile(
                      title: Text(
                        'Sunrise',
                        style: TextStyle(color: Colors.black,fontSize: 16.sp),
                      ),
                      subtitle: Text(
                        "${state.manualPrayerTime.manualSunriseTime??0}",
                        style: TextStyle(color: Colors.black54,fontSize: 12.sp),
                      ),
                    ),
                  ),
                  Divider(color: Colors.black, height: 1),
                  GestureDetector(
                    onTap: () {
                      showSliderDialog(context, state.manualPrayerTime.manualDhuhrTime??0,'Dhuhr');
                    },
                    child: ListTile(
                      title: Text(
                        'Dhuhr',
                        style: TextStyle(color: Colors.black,fontSize: 16.sp),
                      ),
                      subtitle: Text(
                        "${state.manualPrayerTime.manualDhuhrTime??0}",
                        style: TextStyle(color: Colors.black54,fontSize: 12.sp),
                      ),
                    ),
                  ),
                  Divider(color: Colors.black, height: 1),
                  GestureDetector(
                    onTap: () {
                      showSliderDialog(context,state.manualPrayerTime.manualAsrTime??0,'Asr');
                    },
                    child: ListTile(
                      title: Text(
                        'Asr',
                        style: TextStyle(color: Colors.black,fontSize: 16.sp),
                      ),
                      subtitle: Text(
                        "${state.manualPrayerTime.manualAsrTime??0}",
                        style: TextStyle(color: Colors.black54,fontSize: 12.sp),
                      ),
                    ),
                  ),
                  Divider(color: Colors.black, height: 1),
                  GestureDetector(
                    onTap: () {
                      showSliderDialog(context,state.manualPrayerTime.manualMaghribTime??0,'Maghrib');
                    },
                    child: ListTile(
                      title: Text(
                        'Maghrib',
                        style: TextStyle(color: Colors.black,fontSize: 16.sp),
                      ),
                      subtitle: Text(
                        "${state.manualPrayerTime.manualMaghribTime??0}",
                        style: TextStyle(color: Colors.black54,fontSize: 12.sp),
                      ),
                    ),
                  ),
                  Divider(color: Colors.black, height: 1),
                  GestureDetector(
                    onTap: () {
                      showSliderDialog(context, state.manualPrayerTime.manualIshaTime??0,"Isha");
                    },
                    child: ListTile(
                      title: Text(
                        'Isha\'a',
                        style: TextStyle(color: Colors.black,fontSize: 16.sp),
                      ),
                      subtitle: Text(
                        "${state.manualPrayerTime.manualIshaTime??0}",
                        style: TextStyle(color: Colors.black54,fontSize: 12.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      );
  },
),
      backgroundColor: Colors.white, // White background
    );
  }



  void showSliderDialog(BuildContext context, int initialValue,String prayerName) {
    final FixedExtentScrollController scrollController =
    FixedExtentScrollController(initialItem: initialValue + 59); // Map initial value to index

    int selectedValue = initialValue;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
              builder: (context, state) {
    return AlertDialog(
              title: const Text(
                "Manual Corrections",
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
                          right: 0, // Add constraints to prevent infinite width
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.black, width: 1),
                                bottom: BorderSide(color: Colors.black, width: 1),
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
                            context.read<PrayerTimeBloc>().add(PrayerTimeEvent.onchangeTimeSelected(onchangeTime: index-59));

                            print("Selected value is ${state.selectedTime}");
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              final value = index - 59;
                              final isSelected = value == state.selectedTime;

                              return Center(
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 200),
                                  style: TextStyle(
                                    fontSize: isSelected ? 20 : 16,
                                    fontWeight:
                                    isSelected ? FontWeight.bold : FontWeight.normal,
                                    color: isSelected ? Colors.black : Colors.grey,
                                  ),
                                  child: Text('$value minute'),
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
                    'Selected Time: ${state.selectedTime} minute',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {

                    manualPrayerTime = ManualPrayerTime(
                      manualFajrTime: prayerName.toLowerCase() == 'fajr' ? state.selectedTime : state.manualPrayerTime.manualFajrTime,
                      manualSunriseTime: prayerName.toLowerCase() == 'sunrise' ? state.selectedTime : state.manualPrayerTime.manualSunriseTime,
                      manualDhuhrTime: prayerName.toLowerCase() == 'dhuhr' ? state.selectedTime : state.manualPrayerTime.manualDhuhrTime,
                      manualAsrTime: prayerName.toLowerCase() == 'asr' ? state.selectedTime : state.manualPrayerTime.manualAsrTime,
                      manualMaghribTime: prayerName.toLowerCase() == 'maghrib' ? state.selectedTime : state.manualPrayerTime.manualMaghribTime,
                      manualIshaTime: prayerName.toLowerCase() == 'isha' ? state.selectedTime : state.manualPrayerTime.manualIshaTime,
                    );
                    context.read<PrayerTimeBloc>().add(PrayerTimeEvent.manuallyPrayerTimeChange(manualPrayerTime:manualPrayerTime , prayerName: prayerName));
                  //  onValueSelected(selectedValue); // Pass the selected value
                    Navigator.of(context).pop();
                  },
                  child: const Text('Done'),
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

