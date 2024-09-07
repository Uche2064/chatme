import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hintText,
      required this.validator,
      required this.obscureText,
      this.controller,
      this.keyboardType});

  String? hintText;
  bool obscureText;
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? Function(String? value)? validator;
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: color.primary,
      style: GoogleFonts.poppins(color: color.primary),
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.error, width: 1),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.error.withAlpha(580), width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.tertiary, width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.secondary, width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: color.primary,
        ),
        fillColor: color.surface,
        filled: true,
      ),
    );
  }
}
