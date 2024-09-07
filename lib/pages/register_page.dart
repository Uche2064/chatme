import 'package:chatme/components/custom_button.dart';
import 'package:chatme/components/custom_text_field.dart';
import 'package:chatme/controller/auth_controller.dart';
import 'package:chatme/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, this.onTap});
  void Function()? onTap;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _confirmPwdController = TextEditingController();
  AuthController authController = Get.put(AuthController());
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      body: Center(
        child: SingleChildScrollView(
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
                  "Let's create an account for you🤩",
                  style:
                      GoogleFonts.poppins(color: color.primary, fontSize: 16),
                ),
                const Gap(25),

                // email field

                Form(
                    key: registerKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: "Email",
                          controller: _emailController,
                          obscureText: false,
                          validator: (value) =>
                              Validators.validateEmail(value!),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const Gap(10),

                        // password field
                        CustomTextField(
                          hintText: "Password",
                          obscureText: true,
                          controller: _pwdController,
                          validator: (value) =>
                              Validators.validatePasswordLength(value!),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const Gap(10),

                        // password field
                        CustomTextField(
                          hintText: "Confirm password",
                          obscureText: true,
                          controller: _confirmPwdController,
                          validator: (value) =>
                              Validators.validatePasswordLength(value!),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ],
                    )),
                const Gap(30),

                // login button
                CustomButton(
                  text: 'Register',
                  onTap: () => authController.register(
                      email: _emailController.text,
                      password: _pwdController.text,
                      confirmPassword: _confirmPwdController.text,
                      formKey: registerKey),
                ),

                const Gap(20),

                // new here ? register now

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member ?",
                      style: GoogleFonts.poppins(
                          color: color.primary, fontSize: 16),
                    ),
                    const Gap(4),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(
                            color: color.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
