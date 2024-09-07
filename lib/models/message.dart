import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  String? senderId;
  String? senderEmail;
  String? receiverId;
  String? message;
  DateTime? sentAt; 

  Message({
    this.senderId,
    this.receiverId,
    this.senderEmail,
    this.message,
    this.sentAt,
  });

  factory Message
  .fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

