import 'package:chatme/pages/login_page.dart';
import 'package:chatme/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginOrRegister extends StatelessWidget {
  LoginOrRegister({super.key});

  // initialy show login
  RxBool showLoginPage = true.obs;


  // toggle between pages
  void toggleLogin() {
    showLoginPage.value = !showLoginPage.value;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => showLoginPage.value
        ? LoginPage(
            onTap: () => toggleLogin(),
          )
        : RegisterPage(
            onTap: () => toggleLogin(),
          ));
  }
}
