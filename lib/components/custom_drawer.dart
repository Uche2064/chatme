import 'package:chatme/controller/auth_controller.dart';
import 'package:chatme/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    size: 50,
                    color: Get.theme.colorScheme.inversePrimary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Get.theme.colorScheme.primary,
                  ),
                  title: Text(
                    "H O M E",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                  onTap: () => {
                    Navigator.pop(context)
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Get.theme.colorScheme.primary,
                  ),
                  title: Text(
                    "S E T T I N G S",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                  onTap: () => {
                    Navigator.pop(context),
                    Get.to(() => SettingsPage())
                  },
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Get.theme.colorScheme.primary,
              ),
              title: Text(
                "L O G O U T",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              onTap: authController.logout,
            ),
          )
        ],
      ),
    );
  }
}
