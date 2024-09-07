import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPageTitle extends StatelessWidget {
  const CustomPageTitle({super.key, required this.pageTitle});
  final String pageTitle;
  @override
  Widget build(BuildContext context) {
    return Text(
          pageTitle,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ));
  }
}