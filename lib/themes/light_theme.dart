import 'package:flutter/material.dart';
import 'package:get/get.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: const Color(0xFFadbbda),
    primary: const Color(0xFF3d52a0),
    secondary: const Color(0xFF7091e6),
    tertiary: const Color(0xFF8697c4),
    inversePrimary: Colors.blueGrey.shade900,
    error: Colors.red.shade900,
    onPrimary: const Color.fromARGB(255, 142, 195, 255),
  ),
  scaffoldBackgroundColor: Get.theme.colorScheme.surface,
);
