import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/utils/colors/pallete.dart';

class CustomDescriptionField extends StatelessWidget {
  final Color? fillColor;
  final bool? filled;
  final Color? focusedBorderColor;
  final Color? defaultBorderColor;
  final TextEditingController? controller;
  final String? labelText;
  final void Function(String?)? onChanged;
  final TextStyle? labelStyle;
  final TextStyle? inputTextStyle;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;
  final Widget? suffixIconButton;
  final bool? enabled;

  const CustomDescriptionField({
    super.key,
    this.controller,
    this.fillColor,
    this.filled,
    this.defaultBorderColor,
    this.focusedBorderColor,
    required this.labelText,
    this.labelStyle,
    this.inputTextStyle,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIconButton,
    this.enabled,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Ensures the field takes up the maximum width
      child: TextField(
        maxLength: 300, // Allows up to 300 characters
        keyboardType: keyboardType ?? TextInputType.multiline,
        maxLines: null, // Allows the field to expand vertically as needed
        controller: controller,
        onChanged: onChanged,
        enabled: enabled ?? true,
        decoration: InputDecoration(
          fillColor: fillColor,
          filled: filled ?? false,
          counterText: '', // Hides the counter below the field
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIconButton,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: defaultBorderColor ?? Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: defaultBorderColor ?? Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                color: focusedBorderColor ?? Pallete.originBlue),
          ),
          labelText: labelText ?? '',
          labelStyle: labelStyle ??
              GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
        ),
        style: inputTextStyle ??
            TextStyle(
              color: Pallete.originBlue,
              fontSize: 12,
            ),
      ),
    );
  }
}
