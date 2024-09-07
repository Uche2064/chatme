// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      senderId: json['senderId'] as String?,
      receiverId: json['receiverId'] as String?,
      senderEmail: json['senderEmail'] as String?,
      message: json['message'] as String?,
      sentAt: json['sentAt'] == null
          ? null
          : DateTime.parse(json['sentAt'] as String),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'senderId': instance.senderId,
      'senderEmail': instance.senderEmail,
      'receiverId': instance.receiverId,
      'message': instance.message,
      'sentAt': instance.sentAt?.toIso8601String(),
    };
