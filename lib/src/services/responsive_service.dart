import 'package:flutter/material.dart';

bool isIpad(BuildContext context) {
  bool value = MediaQuery.of(context).size.width > 500;
  return value;
}

bool isLargeScreen = false;

class CheckScreenSize {
  CheckScreenSize();

  checkScreenSize(BuildContext context) {
    isLargeScreen = isIpad(context);
  }
}
