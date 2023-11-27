import 'package:assignment_neostar/common/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

InputDecorationTheme themeDecoration = InputDecorationTheme(
  border: OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: ColorConstants.primaryColor,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: ColorConstants.primaryColor,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: ColorConstants.primaryColor,
    ),
  ),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: ColorConstants.errorColor,
    ),
  ),
  errorStyle: const TextStyle(
    fontSize: 12,
    color: ColorConstants.errorColor,
  ),
  prefixIconColor: ColorConstants.primaryColor,
  suffixIconColor: ColorConstants.primaryColor,
  hintStyle: TextStyle(
    fontSize: 12.sp,
    color: ColorConstants.hintColor.withOpacity(0.4),
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w100,
  ),
);
