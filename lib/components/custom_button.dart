import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, this.onTap});

  String text;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color.tertiary,
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: color.inversePrimary,
              ),
        ),
      ),
    );
  }
}
