import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ramadantimes/src/auth/presentation/widgets/custom_text_form_field.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../bloc/sign_in_bloc/sign_in_bloc.dart';

class ForgetPasswordOtpPage extends StatefulWidget {
  @override
  State<ForgetPasswordOtpPage> createState() => _ForgetPasswordOtpPageState();
}

class _ForgetPasswordOtpPageState extends State<ForgetPasswordOtpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  late Timer _timer;
  int _remainingSeconds = 60;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer.cancel(); // Stop the timer when it reaches 0
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }
  @override
  void dispose() {
    _emailFocusNode
        .dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Color(0xffF7F5FF),
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              'OTP Verification',
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#1C1B1F")),
            ),
            leading: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(
                'assets/images/forward_back.svg',
                height: 16.h,
                width: 16.w,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          body:SafeArea(
            child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            Expanded(child: SizedBox()),
                            Container(
                              // height: 460.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(24.0.sp),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Text(
                                        'Enter code sent to\nyour email',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 28.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text: 'Please enter the 6 digit security code we just sent you at ',
                                          style: TextStyle(fontSize: 16.sp, color: Color(0xff75718B)),
                                          children: [
                                            TextSpan(
                                              text: 'info@devxhub.com',
                                              style: TextStyle(color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 40.h),
                                      PinCodeTextField(
                                        obscureText: true,
                                        appContext: context,
                                        length: 6,
                                        onChanged: (value) {},
                                        keyboardType: TextInputType.number,
                                        controller: pinCodeController,
                                        pinTheme: PinTheme(
                                          shape: PinCodeFieldShape.box,
                                          borderRadius: BorderRadius.circular(5),
                                          fieldHeight: 50,
                                          fieldWidth: 40,
                                          activeFillColor: Colors.white, // Background color for active field
                                          selectedFillColor: Colors.white, // Background color for selected field
                                          inactiveFillColor: Colors.grey[200]!, // Background for inactive fields
                                          activeColor: Colors.blue, // Border color when active
                                          selectedColor: Colors.blue, // Border color when selected
                                          inactiveColor: Colors.transparent, // No border for inactive fields
                                        ),
                                        enableActiveFill: true, // Enables the fill color
                                      ),

                                      SizedBox(height: 16.h),
                                      Center(
                                        child: Text(
                                          "${_formatTime(_remainingSeconds)}"
                                            ,
                                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text: 'Didn’t receive code?',
                                          style: TextStyle(fontSize: 14.sp, color: Color(0xff75718B)),
                                          children: [
                                            TextSpan(
                                              text: ' Resend Code',
                                              style: TextStyle(color: Colors.black,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                      SizedBox(
                                        height: 40.h,
                                        width: double.maxFinite,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: HexColor("#6348EB"),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(100.r),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (formKey.currentState!.validate()) {

                                              // context.read<SignInBloc>().add(
                                              //     SignInEvent.signInDataSubmit(
                                              //         userEmail: emailController.text,
                                              //         userPassword: passwordController.text,
                                              //         context: context));
                                            }
                                          },
                                          child: Center(
                                            child: state.signInStatus ==
                                                SignInStatus.inProgress
                                                ? SizedBox(
                                                height: 16.h,
                                                width: 16.w,
                                                child:
                                                CircularProgressIndicator.adaptive())
                                                : Text(
                                              'Submit Otp',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        );
      },
    );
  }
}
