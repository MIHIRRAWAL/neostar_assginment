import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LabelTextWidget extends StatelessWidget {
  const LabelTextWidget({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12.sp,
          fontFeatures: const [
            FontFeature.superscripts(),
          ],
        ),
      ),
    );
  }
}
