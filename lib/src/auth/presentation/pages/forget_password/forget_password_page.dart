import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ramadantimes/src/app.dart';
import 'package:ramadantimes/src/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:ramadantimes/src/component/splash_page.dart';
import 'package:ramadantimes/src/services/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../bloc/sign_in_bloc/sign_in_bloc.dart';


class ForgotPasswordPage extends StatefulWidget {
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Add a listener to detect focus changes
    _emailFocusNode.addListener(() {
      setState(() {}); // Update the UI when the focus changes
    });
  }

  @override
  void dispose() {
    _emailFocusNode
        .dispose();
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
              'Forgot password',
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
                                        'Forgot password',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Text(
                                        'Please enter your email address and\nwe will send you code',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16.sp, color: Color(0xff75718B)),
                                      ),
                                      SizedBox(height: 40.h),
                                      CustomTextField(
                                        editingController: emailController,
                                        focusNode: _emailFocusNode,
                                        labelText: 'Your Email',
                                        hintText: 'Enter your email',
                                        prefixIcon: Icon(
                                          Icons.email_rounded,
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .pleaseEnterYourEmailAddress;
                                          }
                                          // Email validation using regex
                                          final emailRegex = RegExp(
                                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                          if (!emailRegex.hasMatch(value)) {
                                            return AppLocalizations.of(context)!
                                                .pleaseEnterYourEmailAddress;
                                          }
                                          return null;
                                        },
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
                                           // context.pushNamed("forget_password_otp_page");
                                            if (formKey.currentState!.validate()) {
                                              context.read<SignInBloc>().add(
                                                  SignInEvent.forgetPasswordOtpSubmit(
                                                     forgetPasswordMail: emailController.text,
                                                      context: context));
                                              emailController.clear();
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
                                              'Continue',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      //   children: [
                                      //     Text(
                                      //       "Don't have an account?",
                                      //       style: TextStyle(
                                      //         fontSize: 14.sp,
                                      //         fontWeight: FontWeight.w500,
                                      //         color: HexColor("#75718B"),
                                      //       ),
                                      //     ),
                                      //     Text(
                                      //       ' Sign Up',
                                      //       style: TextStyle(
                                      //         fontSize: 14.sp,
                                      //         fontWeight: FontWeight.w700,
                                      //         color: Colors.black,
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
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
