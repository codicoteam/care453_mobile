import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/utils/colors/pallete.dart';

class CustomePhoneNumber extends StatelessWidget {
  final Color? fillColor;
  final bool? filled;
  final Color? focusedBoarderColor;
  final Color? defaultBoarderColor;
  final TextEditingController? controller;
  final String? labelText;
  final void Function(String)? onChanged;
  final TextStyle? labelStyle;
  final TextStyle? inputTextStyle;
  final Icon? prefixIcon;
  final Widget? suffixIconButton;
  final bool? enabled;

  CustomePhoneNumber({
    super.key,
    this.controller,
    this.fillColor,
    this.filled,
    this.defaultBoarderColor,
    this.focusedBoarderColor,
    required this.labelText,
    this.labelStyle,
    this.inputTextStyle,
    required this.prefixIcon,
    this.suffixIconButton,
    this.enabled,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      onChanged: onChanged,
      enabled: enabled ?? true,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // Ensures only numeric input
      ],
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: filled ?? false,
        counterText: '',
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIconButton,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: defaultBoarderColor ?? Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: defaultBoarderColor ?? Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: focusedBoarderColor ?? Pallete.primaryColor),
        ),
        labelText: labelText ?? '',
        labelStyle: labelStyle ?? GoogleFonts.poppins(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      style: inputTextStyle ??
          TextStyle(
            color: Pallete.primaryColor,
            fontSize: 12,
          ),
    );
  }
}
