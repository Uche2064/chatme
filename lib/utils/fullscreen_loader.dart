import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullscreenLoader {
  static void showFullscreenLoader() {
    showDialog(
        barrierDismissible: false,
        context: Get.overlayContext!,
        builder: (context) => const PopScope(
              canPop: false,
              child: Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 170, 210, 255),
                ),
              ),
            ));
  }

  static hideFullscreenLoader() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
