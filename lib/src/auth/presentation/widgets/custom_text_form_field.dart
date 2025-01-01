import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    this.autoValidateMode,
    this.validator,
    this.onTap,
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
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.error)) {
              return Colors.red; // Color when there's an error
            } else if (states.contains(WidgetState.focused)) {
              return HexColor("#6348EB");
            }
            return Colors.grey; // Default color
          }),
          suffixIconColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.error)) {
              return Colors.red; // Color when there's an error
            }
            return Colors.grey.shade700; // Default color
          }),
        ),
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        textInputAction: textInputAction,
        focusNode: focusNode,
        keyboardType: textInputType,
        readOnly: readOnly ?? false,
        maxLines: maxLines,
        onChanged: onChanged,
        onTap: onTap,
        validator: validator,
        controller: editingController,
        obscureText: obscureText,
        autovalidateMode: autoValidateMode,
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
        // style: theme.bodyLargeTextStyle,
      ),
    );
  }
}

InputDecoration customInputDecoration({
  String? labelText,
  FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.auto,
  String? hintText,
  String? helperText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool filled = false,
  Color fillColor = const Color(0x1E767680),
  Color focusColor = const Color(0x1E767680),
  Color hoverColor = Colors.white,
  BorderSide borderSide = const BorderSide(
    color: Colors.black,
    width: 1.0,
  ),
  BorderSide errorBorderSide = const BorderSide(
    color: Colors.red,
    width: 1.0,
  ),
  double borderRadius = 8.0,
  double verticalPadding = 16.0,
  double horizontalPadding = 16.0,
}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(
      vertical: verticalPadding,
      horizontal: horizontalPadding,
    ),
    isDense: false,
    labelText: labelText,
    floatingLabelBehavior: floatingLabelBehavior,
    border: OutlineInputBorder(
      borderSide: borderSide,
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: borderSide,
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: borderSide,
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: errorBorderSide,
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
    ),
    focusColor: focusColor,
    fillColor: fillColor,
    filled: filled,
    hoverColor: hoverColor,
    hintText: hintText,
    helperText: helperText,
    helperMaxLines: 3,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
  );
}
