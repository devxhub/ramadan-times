import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerTimeRow extends StatelessWidget {
  final String prayerName;
  final String timeRange;
  final bool isCurrentPrayer;
  final IconData icon;

  const PrayerTimeRow({
    super.key,
    required this.prayerName,
    required this.timeRange,
    required this.isCurrentPrayer,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Colors.white,
            const Color.fromARGB(255, 225, 212, 246).withOpacity(0.5),
            const Color.fromARGB(255, 167, 126, 237).withOpacity(0.8),
          ],
        ),
        color: isCurrentPrayer ? Color(0xFFE6E6FA) : Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.2),
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(6.r),
                    child: Icon(
                      size: 18.sp,
                      icon,
                      color: isCurrentPrayer ? Colors.red : Colors.deepPurple,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  prayerName,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: isCurrentPrayer ? Colors.red : Colors.deepPurple,
                  ),
                ),
              ],
            ),
            Text(
              timeRange,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: isCurrentPrayer ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
