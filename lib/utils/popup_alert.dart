import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';

class PopupAlert {
  static successAlert({required Widget text}) {
    ElegantNotification.success(
      description: text,
      toastDuration: const Duration(seconds: 2),
      animation: AnimationType.fromTop,
    );
  }

  static errorAlert({required Widget text}) {
    print("tapped");
    ElegantNotification.error(
      description: text,
      toastDuration: const Duration(seconds: 2),
      animation: AnimationType.fromTop,
    );
  }
}
