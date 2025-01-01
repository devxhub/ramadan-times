import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../services/constants.dart';
import '../bloc/sign_in_bloc/sign_in_bloc.dart';
import '../widgets/custom_text_form_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    isRememberMe();

    _emailFocusNode.addListener(() {
      setState(() {});
    });
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> isRememberMe() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final isRememberMe = prefs.getBool(Constant.isRememberMe);
    if (isRememberMe == true) {
      final password = prefs.getString(Constant.password).toString();
      final email = prefs.getString(Constant.email).toString();
      emailController.text = email;
      passwordController.text = password;
    }
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
              'Sign In',
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
                                    'Welcome!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    'Sign in to continue!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Color(0xff75718B)),
                                  ),
                                  SizedBox(height: 100.h),
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
                                  CustomTextField(
                                    editingController: passwordController,
                                    focusNode: _passwordFocusNode,
                                    labelText: 'Password',
                                    hintText: 'Enter your password',
                                    prefixIcon: Icon(
                                      Icons.lock_rounded,
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        context.read<SignInBloc>().add(
                                            SignInEvent.isPasswordObscure());
                                      },
                                      child: Icon(
                                        state.isPasswordObscure == true
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: HexColor("#75718B"),
                                      ),
                                    ),
                                    obscureText: state.isPasswordObscure,
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                              activeColor: HexColor("#75718B"),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2
                                                        .r), // Set border radius
                                                side: BorderSide(
                                                  color: HexColor(
                                                      "#75718B"), // Customize border color
                                                  width:
                                                      2.0.w, // Set border width
                                                ),
                                              ),
                                              value: state.isRemember,
                                              onChanged: (value) {
                                                context.read<SignInBloc>().add(
                                                    SignInEvent.isRemember(
                                                        isRememberMe:
                                                            value ?? false));
                                              }),
                                          Text(
                                            'Remember me',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: HexColor("#75718B"),
                                            ),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          context.pushNamed(
                                              "forgot_password_page");
                                        },
                                        child: Text(
                                          'Forgot password?',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: HexColor("#75718B"),
                                          ),
                                        ),
                                      ),
                                    ],
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
                                        if (formKey.currentState!.validate()) {
                                          context.goNamed("schedule");
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
                                                child: CircularProgressIndicator
                                                    .adaptive())
                                            : Text(
                                                'Sign In',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                              ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't have an account?",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: HexColor("#75718B"),
                                        ),
                                      ),
                                      Text(
                                        ' Sign Up',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
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
            }),
          ),
        );
      },
    );
  }
}
