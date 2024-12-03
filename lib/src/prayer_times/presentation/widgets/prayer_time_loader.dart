import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerTimeLoader extends StatelessWidget {
  const PrayerTimeLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: const Color.fromARGB(255, 218, 218, 249),
      borderRadius: BorderRadius.circular(15.w),
      elevation: 2,
      shadowColor: const Color.fromARGB(255, 218, 218, 249),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(15.w),
        ),
        child: Column(
          children: List.generate(
            9,
            (index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Color(0xFFE6E6FA),
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 16.w,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  color: Color(0xFFE6E6FA),
                  child: SizedBox(
                    height: 40.h, // Set a fixed height for the loader
                    width: double.infinity,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
