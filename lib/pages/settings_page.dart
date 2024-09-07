import 'package:chatme/components/custom_page_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Get.theme.colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        title: const CustomPageTitle(pageTitle: 'Settings'),
      ),
    );
  }
}
