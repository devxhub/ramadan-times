import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../services/responsive_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      _showBottomSheet();
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.sp)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      context.go("/");
                    },
                    child: CircleAvatar(
                      radius: 10.sp,
                      backgroundColor: Colors.black,
                      child: Icon(
                        FontAwesomeIcons.x,
                        size: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Gap(16.h),
              Text(
                'Sign Up to',
                style: GoogleFonts.dmSans(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w400,
                  color: HexColor('#1F1947'),
                ),
              ),
              Text(
                'Muslim Times',
                style: GoogleFonts.dmSans(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: HexColor('#1F1947'),
                ),
              ),
              Gap(8.h),
              Text(
                'Muslim Times is a digital platform for all\nMuslims to follow prayer time',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                    fontSize: 16, color: HexColor("#1C1646")),
              ),
              const SizedBox(height: 24),
              // Sign up With Google
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image(image: AssetImage('assets/images/Google.png')),
                    label: Text(
                      'Sign Up with Google',
                      style: GoogleFonts.dmSans(color: HexColor('#1C1646')),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ),
              ),
              Gap(12.h),
              // Sign up With Apple
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.apple),
                    label: Text('Sign Up with Apple'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ),
              Gap(12.h),
              // Sign up With Email
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Sign Up with Email',
                      style: GoogleFonts.dmSans(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor('#6348EB'),
                    ),
                  ),
                ),
              ),
              Gap(12.h),
              // Sign in Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.dmSans(
                      color: HexColor('#75718B'),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign in',
                      style: GoogleFonts.dmSans(
                        color: HexColor('#75718B'),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CheckScreenSize().checkScreenSize(context);

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.asset("assets/images/Splash.png"),
      ),
    );
  }
}
