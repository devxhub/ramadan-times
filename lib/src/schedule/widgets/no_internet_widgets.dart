import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetWidgets extends StatelessWidget {
  const NoInternetWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/no_internet.png",
            fit: BoxFit.contain,
            height: 80.sp,
          ),
          SizedBox(
            height: 50.h,
          ),
          AutoSizeText(
            "Oops!",
            style: TextStyle(
                fontSize: 30.sp,
                color: const Color(0xff1C1646),
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20.h,
          ),
          AutoSizeText(
            "There is no Internet connection",
            style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff1C1646),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 6.h,
          ),
          AutoSizeText(
            "Please check your internet connection and try again",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff1C1646),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20.h,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  content: Text("Please Connect to the internet "),
                ),
              );
            },
            child: const Text('Try Again'),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
