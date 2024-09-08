import 'package:chatme/components/chat_bubble.dart';
import 'package:chatme/components/custom_text_field.dart';
import 'package:chatme/controller/auth_controller.dart';
import 'package:chatme/controller/chat_controller.dart';
import 'package:chatme/models/message.dart';
import 'package:chatme/services/chat_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(
      {super.key, required this.receiverName, required this.receiverId});
  final String receiverName;
  final String receiverId;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final AuthController _authController = Get.put(AuthController());

  final ChatController _chatController = Get.put(ChatController());

  final TextEditingController _messageController = TextEditingController();
  final ChatServices _chatServices = ChatServices();
  FocusNode focusNode = FocusNode();
  // for text field
  final ScrollController scrollController = ScrollController();
  void scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 100),
      curve: Curves.fastOutSlowIn,
    );
  }

  void sendMessage({
    required String receiverId,
    required TextEditingController message,
  }) async {
    // if the message is not empty
    if (message.text.isNotEmpty) {
      await _chatServices.sendMessage(
          message: message.text, receiverId: receiverId);
      message.clear();
    }

    scrollDown();
  }

  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () => scrollDown(),
        );
      }
    });

    Future.delayed(
      const Duration(milliseconds: 500),
      () => scrollDown(),
    );
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String currentUserId = _authController.getUser()!.uid;

    _chatController.initializeMessageList(
      currentUserId: currentUserId,
      otherUserId: widget.receiverId,
    );

    return Scaffold(
      backgroundColor: Get.theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(widget.receiverName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // display messsage list
            Expanded(child: _buildMessageList()),

            // input box
            _buildInputField(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    return Obx(() {
      var messageList = _chatController.messageList;
      if (messageList.isEmpty) {
        return const Center(child: Text("No messages yet. Send one"));
      } else {
        return ListView(
          controller: scrollController,
          children: messageList
              .map((message) => _buildMessageListItem(message))
              .toList(),
        );
      }
    });
  }

  Widget _buildMessageListItem(Message message) {
    bool isCurrentUser = message.senderId == _authController.getUser()!.uid;

    return Container(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(text: message.message!, isCurrentUser: isCurrentUser),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Row(
      children: [
        Expanded(
            child: CustomTextField(
          focusNode: focusNode,
          obscureText: false,
          controller: _messageController,
          hintText: 'Type a message',
        )),
        IconButton(
          onPressed: () => sendMessage(
            message: _messageController,
            receiverId: widget.receiverId,
          ),
          icon: const Icon(Icons.arrow_upward),
        )
      ],
    );
  }
}
