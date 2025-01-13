import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final void Function(String?)? onChanged;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? dropdownTextStyle;
  final Color? fillColor;
  final bool? filled;
  final Color? focusedBorderColor;
  final Color? defaultBorderColor;
  final Icon? prefixIcon;
  final Widget? suffixIconButton;
  final bool? enabled;

  CustomDropdown({
    super.key,
    required this.items,
    this.selectedItem,
    this.onChanged,
    this.labelText,
    this.labelStyle,
    this.dropdownTextStyle,
    this.fillColor,
    this.filled,
    this.focusedBorderColor,
    this.defaultBorderColor,
    this.prefixIcon,
    this.suffixIconButton,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedItem,
      onChanged: enabled == false ? null : onChanged,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: filled ?? false,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
          borderSide: BorderSide(color: focusedBorderColor ?? Colors.blue),
        ),
        labelText: labelText ?? '',
        labelStyle: labelStyle ?? GoogleFonts.poppins(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      style: dropdownTextStyle ?? TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
