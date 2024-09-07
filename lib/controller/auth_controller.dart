import 'package:chatme/services/auth_services.dart';
import 'package:chatme/utils/fullscreen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // create authService object
  final AuthService authService = AuthService();
  RxBool isLoading = false.obs;

  // login
  void login(
      {required String email,
      password,
      required GlobalKey<FormState> formKey}) async {
    try {
      if (!formKey.currentState!.validate()) {
        return;
      }
      FullscreenLoader.showFullscreenLoader();
      await authService.signInUser(email, password);

      FullscreenLoader.hideFullscreenLoader();
    } catch (e) {
      FullscreenLoader.hideFullscreenLoader();
      printInfo(info: e.toString());
    }
  }

  // register
  void register(
      {required String email,
      password,
      confirmPassword,
      required GlobalKey<FormState> formKey}) async {
    try {
      FullscreenLoader.showFullscreenLoader();

      if (!formKey.currentState!.validate()) {
        return;
      }
      if (password != confirmPassword) {
        Get.snackbar('Incorrect password', 'Passwords do not match');
        return;
      }

      await authService.signUpUser(email, password);
      FullscreenLoader.hideFullscreenLoader();
    } catch (e) {
      FullscreenLoader.hideFullscreenLoader();
      if (e.toString() == 'email-already-in-use') {
        Get.snackbar('Email in use', 'Email already in use');
      }
      printInfo(info: e.toString());
    }
  }

  // logout
  void logout() {
    authService.signOutUser();
    Get.back();
  }
}
