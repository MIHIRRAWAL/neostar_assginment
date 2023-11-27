import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.hintText,
      this.prefixIconData,
      required this.textInputAction,
      this.controller,
      this.suffixIcon,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.maxLines = 1,
      this.onChanged,
      this.inputFormatters = const [],
      this.readOnly = false,
      this.onTap});

  final String hintText;
  final Icon? prefixIconData;
  final TextInputAction textInputAction;
  final bool obscureText;
  final int maxLines;
  final TextInputType keyboardType;

  final Widget? suffixIcon;
  final String? Function(String? value)? validator;
  final Function(String? value)? onChanged;
  final List<TextInputFormatter> inputFormatters;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIconData,
            suffixIcon: suffixIcon),
        validator: validator,
        cursorColor: themeData.primaryColor,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        obscureText: obscureText,
        obscuringCharacter: '*',
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        onChanged: onChanged,
        onTap: onTap,
        readOnly: readOnly,
      ),
    );
  }
}
