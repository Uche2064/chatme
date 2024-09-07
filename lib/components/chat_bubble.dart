import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(
      {super.key, required this.text, required this.isCurrentUser});
  final String text;
  final bool isCurrentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isCurrentUser
              ? Get.theme.colorScheme.primary
              : Get.theme.colorScheme.secondary),
      child: Text(
        text,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
    );
  }
}
