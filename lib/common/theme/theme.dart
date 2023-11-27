import 'package:assignment_neostar/common/constants/color.dart';
import 'package:assignment_neostar/common/theme/elevated_button.dart';
import 'package:assignment_neostar/common/theme/outline_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'input_decoration.dart';
import 'app_bar_theme.dart';

final ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: ColorConstants.primaryColor,
  appBarTheme: appBarTheme,
  inputDecorationTheme: themeDecoration,
  outlinedButtonTheme: outlineButtonTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  textTheme: GoogleFonts.montserratTextTheme(),
);
