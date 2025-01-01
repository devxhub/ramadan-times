import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText = '',
    this.labelText = '',
    this.helperText,
    this.editingController,
    this.onChanged,
    this.error = false,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.readOnly,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.maxLines = 1,
    this.floatingLabelBehavior,
    this.validator,
    this.autoValidateMode,
  });

  final String labelText;
  final String hintText;
  final String? helperText;
  final bool error;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? Function(String? value)? validator;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextEditingController? editingController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool? readOnly;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final int maxLines;
  final AutovalidateMode? autoValidateMode;

  @override
  Widget build(BuildContext context) {
    bool obscureText = false;
    return TextFormField(
      //key: _formKey,
      cursorColor: HexColor("#6348EB"),
      textInputAction: textInputAction,
      focusNode: focusNode,
      keyboardType: textInputType,
      readOnly: readOnly ?? false,
      maxLines: maxLines,
      onTap: onTap,
      onChanged: onChanged,
      validator: validator,
      controller: editingController,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 15.0.w),
        isDense: false,
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: HexColor("#75718B"),
        ),
        floatingLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: HexColor("#6348EB"),
        ),
        floatingLabelBehavior: floatingLabelBehavior,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4.0.r),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4.0.r),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: error ? Colors.red : HexColor("#75718B"),
            width: 1.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4.0.r),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: error ? Colors.red : HexColor("#6348EB"),
            width: 1.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4.0.r),
          ),
        ),
        focusColor: HexColor("#6348EB"),
        fillColor: Colors.transparent,
        filled: true,
        hoverColor: Colors.white,
        hintText: hintText,
        helperText: helperText,
        helperMaxLines: 3,
        //helperStyle: theme.bodyTextStyle,
        prefixIcon: prefixIcon,
        suffix: suffixIcon,
        hintStyle: TextStyle(fontSize: 16.sp, color: HexColor("#75718B80")),
      ),
      autovalidateMode: autoValidateMode,
      style: GoogleFonts.manrope(
        color: Colors.black,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.40.sp,
      ),
    );
  }
}

class CustomPasswordTextField extends StatelessWidget {
  const CustomPasswordTextField(
      {super.key,
      this.labelText = '',
      this.hintText = '',
      this.helperText,
      this.editingController,
      this.onChanged,
      this.error = false,
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.isReadOnly,
      this.prefixIcon,
      this.suffixIcon,
      this.focusNode,
      this.maxLines = 1,
      this.floatingLabelBehavior,
      this.validator,
      this.autoValidateMode,
      this.isObscureText});

  final String labelText;
  final String hintText;
  final String? helperText;
  final bool error;
  final Function(String)? onChanged;
  final String? Function(String? value)? validator;
  final TextEditingController? editingController;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool? isReadOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final int maxLines;
  final AutovalidateMode? autoValidateMode;
  final bool? isObscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //key: _formKey,
      cursorColor: Theme.of(context).primaryColor,
      textInputAction: TextInputAction.done,
      focusNode: focusNode,
      keyboardType: textInputType,
      readOnly: isReadOnly ?? false,
      maxLines: maxLines,
      onChanged: onChanged,
      validator: validator,
      controller: editingController,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 15.0.w),
        isDense: false,
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: HexColor("#75718B"),
        ),
        floatingLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: HexColor("#6348EB"),
        ),
        floatingLabelBehavior: floatingLabelBehavior,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4.0.r),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4.0.r),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: error ? Colors.red : HexColor("#75718B"),
            width: 1.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4.0.r),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: error ? Colors.red : HexColor("#6348EB"),
            width: 1.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4.0.r),
          ),
        ),
        focusColor: HexColor("#6348EB"),
        fillColor: Colors.transparent,
        filled: true,
        hoverColor: Colors.white,
        hintText: hintText,
        helperText: helperText,
        helperMaxLines: 3,
        //helperStyle: theme.bodyTextStyle,
        prefixIcon: prefixIcon,
        suffix: suffixIcon,
        hintStyle: TextStyle(fontSize: 16.sp, color: HexColor("#75718B80")),
      ),
      autovalidateMode: autoValidateMode,
      obscureText: isObscureText ?? false,
      style: GoogleFonts.manrope(
        color: Colors.black,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.40.sp,
      ),
    );
  }
}
