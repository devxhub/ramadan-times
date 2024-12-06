import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadantimes/src/prayer_times/data/models/prayer_time_format_model.dart';

import '../bloc/prayer_time_bloc.dart';

class CustomPrayerTimeConvention extends StatefulWidget {
  const CustomPrayerTimeConvention({super.key});

  @override
  State<CustomPrayerTimeConvention> createState() =>
      _CustomPrayerTimeConventionState();
}

class _CustomPrayerTimeConventionState
    extends State<CustomPrayerTimeConvention> {
  List<double> generateDropdownValues() {
    return List.generate(
      ((23.5 - 9) / 0.5).ceil() + 1,
      (index) => 9 + (index * 0.5),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<double> dropdownValues = generateDropdownValues();

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: CircleAvatar(
              radius: 15.r,
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        title: Text(
          'Custom Angle',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
        builder: (context, state) {
          print(state.selectedFajrAngle);
          print(state.selectedIshaAngle);
          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Fajr Angle:',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                DropdownButton<double>(
                  value: state.selectedFajrAngle,
                  onChanged: (value) {
                    context.read<PrayerTimeBloc>().add(
                          PrayerTimeEvent.selectAngle(
                            fajrAngle: value!,
                            ishaAngle: state.selectedIshaAngle,
                            prayerConventionName:
                                state.selectedPrayerConventionName,
                          ),
                        );
                  },
                  items: dropdownValues.map((double value) {
                    return DropdownMenuItem<double>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Select Isha Angle:',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                DropdownButton<double>(
                  value: state.selectedIshaAngle,
                  onChanged: (value) {
                    context.read<PrayerTimeBloc>().add(
                          PrayerTimeEvent.selectAngle(
                            fajrAngle: state.selectedIshaAngle,
                            ishaAngle: value!,
                            prayerConventionName:
                                state.selectedPrayerConventionName,
                          ),
                        );
                  },
                  items: dropdownValues.map((double value) {
                    return DropdownMenuItem<double>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
