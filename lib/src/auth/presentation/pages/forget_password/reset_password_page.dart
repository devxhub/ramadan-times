import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../bloc/sign_in_bloc/sign_in_bloc.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/reset_password_dialog.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController resetPasswordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _resetPasswordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Add a listener to detect focus changes
    _passwordFocusNode.addListener(() {
      setState(() {}); // Update the UI when the focus changes
    });
    _resetPasswordFocusNode.addListener(() {
      setState(() {}); // Update the UI when the focus changes
    });
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _resetPasswordFocusNode.dispose();
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
              'Reset Password',
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
          body: SafeArea(
            child: LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context)
                      .viewInsets
                      .bottom, // Adjust for keyboard
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
                          child: SizedBox(
                            height: 400.h,
                            child: Padding(
                              padding: EdgeInsets.all(24.0.sp),
                              child: Form(
                                key: formKey,
                                child: SingleChildScrollView(

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Text(
                                        'Enter a new password',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Text(
                                        'At least 8 characters, with uppercase\nand lowercase letters',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Color(0xff75718B)),
                                      ),
                                      SizedBox(height: 40.h),
                                      CustomTextField(
                                        editingController: passwordController,
                                        focusNode: _passwordFocusNode,
                                        labelText: 'New Password',
                                        hintText: 'Enter your password',
                                        prefixIcon: Icon(
                                          Icons.lock_rounded,
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            context.read<SignInBloc>().add(
                                                SignInEvent
                                                    .isConfirmPasswordObscure());
                                          },
                                          child: Icon(
                                            state.isNewPasswordObscure == true
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: HexColor("#75718B"),
                                          ),
                                        ),
                                        obscureText: state.isNewPasswordObscure,
                                        autoValidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .pleaseEnterYourPassword;
                                          } else if (value.length < 8) {
                                            return AppLocalizations.of(context)!
                                                .passwordMustBeAtLeast8Characters;
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(height: 16.h),
                                      CustomTextField(
                                        editingController:
                                            resetPasswordController,
                                        focusNode: _resetPasswordFocusNode,
                                        labelText: 'Confirm New Password',
                                        hintText: 'Enter your confirm password',
                                        prefixIcon: Icon(
                                          Icons.lock_rounded,
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            context.read<SignInBloc>().add(
                                                SignInEvent
                                                    .isConfirmNewPasswordObscure());
                                          },
                                          child: Icon(
                                            state.isConfirmNewPasswordObscure ==
                                                    true
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: HexColor("#75718B"),
                                          ),
                                        ),
                                        autoValidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        obscureText:
                                            state.isConfirmNewPasswordObscure,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .pleaseEnterYourPassword;
                                          } else if (value.length < 8) {
                                            return AppLocalizations.of(context)!
                                                .passwordMustBeAtLeast8Characters;
                                          }
                                          if (value != passwordController.text) {
                                            return 'Your password does not match';
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
                                              borderRadius:
                                                  BorderRadius.circular(100.r),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (context) {
                                                  return Stack(
                                                    children: [
                                                      // Background blur
                                                      BackdropFilter(
                                                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                                        child: Container(
                                                          color: Colors.black.withOpacity(0), // Transparent background to apply blur
                                                        ),
                                                      ),
                                                      // Dialog
                                                      Center(
                                                        child: PasswordResetDialog(),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                             // context.read<SignInBloc>().add(SignInEvent.resetPassword(forgetPasswordMail: state.forgetPasswordMail, password: passwordController.text, context: context));
                                            }
                                          },
                                          child: Center(
                                            child: state.signInStatus ==
                                                    SignInStatus.inProgress
                                                ? SizedBox(
                                                    height: 16.h,
                                                    width: 16.w,
                                                    child:
                                                        CircularProgressIndicator
                                                            .adaptive())
                                                : Text(
                                                    'Change Password',
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
