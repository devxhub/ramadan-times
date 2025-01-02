import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class PasswordResetDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: HexColor("#FFFBFE"),
      shadowColor: HexColor("#34405466"),


      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Container(
        width: 335.w,
        height: 200.h,

        padding: EdgeInsets.symmetric(horizontal:24.w,vertical: 22.h),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password Reset",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Your password has been reset\nsuccessfully",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14.sp,
              fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    context.go(
                      '/sign_in_page',
                      extra: {
                        'showBackButton': false,
                      },
                    );
                    Navigator.of(context).pop();

                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#6348EB"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}