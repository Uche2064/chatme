import 'package:chatme/components/custom_drawer.dart';
import 'package:chatme/components/custom_page_title.dart';
import 'package:chatme/controller/auth_controller.dart';
import 'package:chatme/controller/chat_controller.dart';
import 'package:chatme/services/chat_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
    final AuthController authController = Get.put(AuthController());
    final ChatController chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        title: const CustomPageTitle(pageTitle: 'Home')
        
      ),
      drawer:const  CustomDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return Obx(() {
      if(chatController.users.isEmpty) {
        return const Center(child: Text('No users available'));
      }
      return ListView(
        children: chatController.users.map((user) => _buildUserListItem()).toList(),
      );
    });
  }

  Widget _buildUserListItem(Map<String, dynamic> userData) {
    // display all users except current user
    return UserTile();
  }
}
