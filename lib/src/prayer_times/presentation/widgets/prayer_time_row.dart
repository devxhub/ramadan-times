import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerTimeRow extends StatelessWidget {
  final String prayerName;
  final String timeRange;
  final bool isCurrentPrayer;

  const PrayerTimeRow({
    super.key,
    required this.prayerName,
    required this.timeRange,
    required this.isCurrentPrayer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      color: isCurrentPrayer ? Color(0xFFE6E6FA) : Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 12.r,
                  backgroundColor: Color.fromARGB(255, 220, 220, 245),
                  child: Icon(
                    Icons.access_time,
                    color: isCurrentPrayer ? Colors.red : Colors.deepPurple,
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
