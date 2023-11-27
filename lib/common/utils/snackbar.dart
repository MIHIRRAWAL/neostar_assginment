import 'package:flutter/material.dart';

class SnackBarWidget {
  static GlobalKey<ScaffoldMessengerState> scaffoldMesenger =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(SnackBar snackBar) {
    scaffoldMesenger.currentState?.hideCurrentSnackBar();
    scaffoldMesenger.currentState?.showSnackBar(snackBar);
  }
}
