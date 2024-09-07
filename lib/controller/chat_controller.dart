import 'package:chatme/models/message.dart';
import 'package:chatme/models/users.dart';
import 'package:chatme/services/chat_services.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final ChatServices _chatServices = ChatServices();
  var users = <Users>[].obs;
  late String currentUserId, otherUserId;
  RxList<Message> messageList = <Message>[].obs;

  @override
  void onInit() {
    super.onInit();
    _chatServices.getUserStream().listen((userList) {
      users.value = userList;
    });
  }


  void initializeMessageList(
      {required String currentUserId, otherUserId}) async {
    this.currentUserId = currentUserId;
    this.otherUserId = otherUserId;

    _chatServices.getMessages(currentUserId, otherUserId).listen((snapshot) {
      messageList.value = snapshot.docs.map((message) {
        return Message.fromJson(message.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
