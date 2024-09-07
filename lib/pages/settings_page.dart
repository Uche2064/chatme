import 'package:chatme/components/custom_page_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  RxBool isDarkMode = false.obs;
  @override
  Widget build(BuildContext context) {
    final color = Get.theme.colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        title: const CustomPageTitle(pageTitle: 'Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark mode",
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
                Obx(() {
                  return CupertinoSwitch(
                      value: isDarkMode.value,
                      onChanged: (val) =>
                          {isDarkMode.value = !isDarkMode.value});
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
