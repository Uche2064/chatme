import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.text, this.onTap});
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Get.theme.colorScheme.tertiary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          onTap: onTap,
          leading: const Icon(Icons.person),
          trailing: const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
          ),
          title: Text(
            text,
            style: GoogleFonts.poppins(
                color: Get.theme.colorScheme.primary,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
