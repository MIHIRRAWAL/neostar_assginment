import 'dart:io';

import 'package:flutter/material.dart';

import '../../common/utils/snackbar.dart';

class AppException implements Exception {
  final String? message;
  AppException({this.message});

  @override
  String toString() {
    return message ?? "";
  }

  static void onError(Object error) {
    if (error is AppException) {
      SnackBarWidget.showSnackbar(
        SnackBar(
          content: Text(error.message.toString()),
        ),
      );
    }
    if (error is SocketException) {
      SnackBarWidget.showSnackbar(
        SnackBar(
          content: Text(error.message),
        ),
      );
    }
    if (error is FormatException) {
      SnackBarWidget.showSnackbar(
        SnackBar(
          content: Text(error.message),
        ),
      );
    }
    if (error is Exception) {
      SnackBarWidget.showSnackbar(
        SnackBar(
          content: Text(error.toString()),
        ),
      );
    }
    return;
  }
}
