import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../l10n/app_localizations.dart';
import '../bloc/sign_up_bloc/sign_up_bloc.dart';
import '../widgets/custom_text_form_field.dart';

class SignUpWithEmail extends StatefulWidget {
  const SignUpWithEmail({super.key});

  @override
  State<SignUpWithEmail> createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Form(
      key: formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xffF7F5FF),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            localization.signUpTitle,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w400,
              color: HexColor("#1C1B1F"),
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              context.go('/splash');
            },
            child: SvgPicture.asset(
              'assets/images/forward_back.svg',
              height: 5.h,
              width: 5.w,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            return BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
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
                          Expanded(
                            child: Container(),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.r),
                                topRight: Radius.circular(30.r),
                              ),
                            ),
                            child: SizedBox(
                              height: 570.h,
                              child: Padding(
                                padding: EdgeInsets.all(24.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Gap(15.h),
                                      Text(
                                        localization.gettingStarted,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.dmSans(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Gap(10.h),
                                      Text(
                                        localization.createAccount,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.dmSans(
                                            fontSize: 16,
                                            color: HexColor('#75718B')),
                                      ),
                                      Gap(40.h),
                                      CustomTextField(
                                        editingController: nameController,
                                        focusNode: nameFocusNode,
                                        labelText: localization.nameLabel,
                                        hintText: localization.nameHint,
                                        prefixIcon: Icon(
                                          Icons.person,
                                          size: 20.sp,
                                        ),
                                        autoValidateMode: AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return localization
                                                .pleaseEnterYourEmail;
                                          }
                                          return null;
                                        },
                                      ),
                                      Gap(16.h),
                                      CustomTextField(
                                        editingController: emailController,
                                        focusNode: emailFocusNode,
                                        labelText: localization.emailLabel,
                                        hintText: localization.emailHint,
                                        prefixIcon: Icon(
                                          Icons.email_rounded,
                                          size: 20.sp,
                                        ),
                                        autoValidateMode: AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return localization
                                                .pleaseEnterYourEmail;
                                          }
                                          final emailRegex = RegExp(
                                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                          if (!emailRegex.hasMatch(value)) {
                                            return localization
                                                .pleaseEnterAValidEmailAddress;
                                          }
                                          return null;
                                        },
                                      ),
                                      Gap(16.h),
                                      CustomTextField(
                                        editingController: passwordController,
                                        focusNode: passwordFocusNode,
                                        labelText: localization.passwordLabel,
                                        hintText: localization.passwordHint,
                                        prefixIcon: Icon(
                                          Icons.lock_rounded,
                                          size: 20.sp,
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            context.read<SignUpBloc>().add(
                                                SignUpEvent.isPasswordObscure());
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 5.h),
                                            child: Icon(
                                              size: 17.sp,
                                              state.isPasswordObscure == true
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: HexColor("#75718B"),
                                            ),
                                          ),
                                        ),
                                        autoValidateMode: AutovalidateMode.onUserInteraction,
                                        obscureText: state.isPasswordObscure,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return localization
                                                .pleaseEnterYourPassword;
                                          } else if (value.length < 8) {
                                            return localization.passwordTooShort;
                                          }
                                          return null;
                                        },
                                      ),
                                      Gap(16.h),
                                      CustomTextField(
                                        editingController:
                                            confirmPasswordController,
                                        focusNode: confirmPasswordFocusNode,
                                        labelText:
                                            localization.confirmPasswordLabel,
                                        hintText: localization.confirmPasswordHint,
                                        prefixIcon: Icon(
                                          Icons.lock_rounded,
                                          size: 20.sp,
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            context.read<SignUpBloc>().add(
                                                SignUpEvent
                                                    .isConfirmPasswordObscure());
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 5.h),
                                            child: Icon(
                                              size: 17.sp,
                                              state.isConfirmNewPasswordObscure ==
                                                      true
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: HexColor("#75718B"),
                                            ),
                                          ),
                                        ),
                                        obscureText:
                                            state.isConfirmNewPasswordObscure,
                                        autoValidateMode: AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return localization
                                                .pleaseEnterYourConfirmPassword;
                                          } else if (value !=
                                              passwordController.text) {
                                            return localization
                                                .confirmPasswordError;
                                          }
                                          return null;
                                        },
                                      ),
                                      Gap(16.h),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: HexColor('#6348EB'),
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5.r),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (formKey.currentState!.validate()) {
                                            context.read<SignUpBloc>().add(
                                                  SignUpEvent.signWithEmail(
                                                    name: nameController.text,
                                                    email: emailController.text,
                                                    password:
                                                        passwordController.text,
                                                    context: context,
                                                  ),
                                                );
                                          }
                                        },
                                        child: state.signUpStatus ==
                                                SignUpStatus.inProgress
                                            ? SizedBox(
                                                height: 16.h,
                                                width: 16.w,
                                                child: SpinKitThreeBounce(
                                                  color: Colors.black,
                                                ),
                                              )
                                            : Text(
                                                localization.signUpButton,
                                                style: GoogleFonts.dmSans(
                                                  fontSize: 14.sp,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                      ),
                                      Gap(16.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            localization.alreadyHaveAccount,
                                            style: GoogleFonts.dmSans(
                                              color: HexColor('#1C1646'),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              context.push(
                                                '/sign_in_page',
                                                extra: {
                                                  'showBackButton': true,
                                                },
                                              );
                                            },
                                            child: Text(
                                              " ${localization.signIn}",
                                              style: GoogleFonts.dmSans(
                                                color: HexColor('#1C1646'),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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
              },
            );
          }),
        ),
      ),
    );
  }
}
