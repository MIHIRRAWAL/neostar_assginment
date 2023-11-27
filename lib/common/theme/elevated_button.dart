import 'package:assignment_neostar/common/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

final ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all<Color>(ColorConstants.primaryColor),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    side: MaterialStateProperty.all<BorderSide>(
      BorderSide(
        color: ColorConstants.primaryColor,
        width: 2,
      ),
    ),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    ),
    textStyle: MaterialStateProperty.all<TextStyle>(
      TextStyle(fontSize: 14.sp),
    ),
    elevation: MaterialStateProperty.all<double>(0),
    padding: MaterialStateProperty.all<EdgeInsets>(
      const EdgeInsets.symmetric(vertical: 16),
    ),
  ),
);
