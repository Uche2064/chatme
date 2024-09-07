import 'package:chatme/services/chat_services.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
   final ChatServices _chatServices = ChatServices();
  var users = <Map<String, dynamic>>[].obs; 

  @override
  void onInit() {
    super.onInit();
    _chatServices.getUserStream().listen((userList) {
      users.value = userList; 
    });
  }
}