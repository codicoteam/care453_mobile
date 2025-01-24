import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/utils/colors/pallete.dart';

class CustomDateOfBirth extends StatefulWidget {
  final Color? fillColor;
  final bool? filled;
  final Color? focusedBorderColor;
  final Color? defaultBorderColor;
  final TextEditingController? controller;
  final String? labelText;
  final void Function(String?)? onChanged;
  final TextStyle? labelStyle;
  final TextStyle? inputTextStyle;
  final Icon? prefixIcon;
  final Widget? suffixIconButton;
  final bool? enabled;

  const CustomDateOfBirth({
    super.key,
    this.controller,
    this.fillColor,
    this.filled,
    this.defaultBorderColor,
    this.focusedBorderColor,
    required this.labelText,
    this.labelStyle,
    this.inputTextStyle,
    required this.prefixIcon,
    this.suffixIconButton,
    this.enabled,
    this.onChanged,
  });

  @override
  State<CustomDateOfBirth> createState() => _CustomDateOfBirthState();
}

class _CustomDateOfBirthState extends State<CustomDateOfBirth> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: _controller,
      onTap: _selectDate,
      onChanged: widget.onChanged,
      enabled: widget.enabled ?? true,
      decoration: InputDecoration(
        fillColor: widget.fillColor,
        filled: widget.filled ?? false,
        counterText: '',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIconButton,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
              BorderSide(color: widget.defaultBorderColor ?? Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
              BorderSide(color: widget.defaultBorderColor ?? Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
              color: widget.focusedBorderColor ?? Pallete.originBlue),
        ),
        labelText: widget.labelText ?? '',
        labelStyle: widget.labelStyle ??
            GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 12,
            ),
      ),
      style: widget.inputTextStyle ??
          TextStyle(
            color: Pallete.originBlue,
            fontSize: 12,
          ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900), // Earliest selectable date
      lastDate: DateTime.now(), // Latest selectable date
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Pallete.originBlue, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            dialogBackgroundColor:
                Colors.white, // Background color of the dialog
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      final formattedDate =
          '${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}';
      setState(() {
        _controller.text = formattedDate;
      });

      if (widget.onChanged != null) {
        widget.onChanged!(formattedDate);
      }
    }
  }
}
