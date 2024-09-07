import 'package:chatme/components/custom_button.dart';
import 'package:chatme/components/custom_text_field.dart';
import 'package:chatme/controller/auth_controller.dart';
import 'package:chatme/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, this.onTap});

  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    AuthController authController = Get.put(AuthController());
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> loginKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: color.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // icon
              Icon(
                Icons.message,
                color: color.inversePrimary,
                size: 60,
              ),

              // welcome back message
              const Gap(50),
              Text(
                "Welcome back, we've missed you😊",
                style: GoogleFonts.poppins(
                  color: color.primary,
                  fontSize: 16,
                ),
              ),
              const Gap(25),

              Form(
                  key: loginKey,
                  child: Column(
                    children: [
                      // email field

                      CustomTextField(
                        hintText: "Email",
                        controller: emailController,
                        obscureText: false,
                        validator: (value) => Validators.validateEmail(value!),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const Gap(10),

                      // password field
                      CustomTextField(
                        hintText: "Password",
                        obscureText: true,
                        controller: passwordController,
                        validator: (value) =>
                            Validators.validatePasswordLength(value!),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  )),

              const Gap(30),

              // login button
              CustomButton(
                text: 'Login',
                onTap: () => authController.login(
                    email: emailController.text, password:  passwordController.text, formKey:  loginKey),
              ),

              const Gap(20),

              // new here ? register now

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New here ?",
                    style:
                        GoogleFonts.poppins(color: color.primary, fontSize: 16),
                  ),
                  const Gap(4),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register now",
                      style: GoogleFonts.poppins(
                        color: color.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
