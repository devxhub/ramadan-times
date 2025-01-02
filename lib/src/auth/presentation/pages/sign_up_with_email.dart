import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../l10n/app_localizations.dart';
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
              height: 16.h,
              width: 16.w,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
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
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
                                  color: Colors.grey,
                                ),
                              ),
                              Gap(40.h),
                              CustomTextField(
                                editingController: nameController,
                                focusNode: nameFocusNode,
                                labelText: localization.nameLabel,
                                hintText: localization.nameHint,
                                prefixIcon: Icon(Icons.person),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return localization.pleaseEnterYourEmail;
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
                                prefixIcon: Icon(Icons.email_rounded),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return localization.pleaseEnterYourEmail;
                                  }
                                  final emailRegex = RegExp(
                                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                  if (!emailRegex.hasMatch(value)) {
                                    return localization.pleaseEnterYourEmail;
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
                                prefixIcon: Icon(Icons.lock_rounded),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return localization.pleaseEnterYourPassword;
                                  } else if (value.length < 8) {
                                    return localization.passwordTooShort;
                                  }
                                  return null;
                                },
                              ),
                              Gap(16.h),
                              CustomTextField(
                                editingController: confirmPasswordController,
                                focusNode: confirmPasswordFocusNode,
                                labelText: localization.confirmPasswordLabel,
                                hintText: localization.confirmPasswordHint,
                                prefixIcon: Icon(Icons.lock_rounded),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return localization.pleaseEnterYourPassword;
                                  } else if (value != passwordController.text) {
                                    return localization.confirmPasswordError;
                                  }
                                  return null;
                                },
                              ),
                              Gap(16.h),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: HexColor('#6348EB'),
                                  padding: EdgeInsets.symmetric(vertical: 5.r),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    // Perform sign-up logic here
                                  }
                                },
                                child: Text(
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
                                  TextButton(
                                    onPressed: () {
                                      context.push('/sign_in_page');
                                    },
                                    child: Text(
                                      localization.signIn,
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
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
