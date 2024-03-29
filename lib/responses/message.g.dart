// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as String,
      subject: json['subject'] as String,
      body: json['body'] as String,
      fromUser: User.fromJson(json['from_user'] as Map<String, dynamic>),
      toUser: User.fromJson(json['to_user'] as Map<String, dynamic>),
      sendBy: User.fromJson(json['send_by'] as Map<String, dynamic>),
      sendTo: User.fromJson(json['send_to'] as Map<String, dynamic>),
      sentAt: DateTime.parse(json['sent_at'] as String),
      isUnread: json['is_unread'] as bool,
      attachment: MessageAttachment.fromJson(
          json['attachment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'body': instance.body,
      'from_user': instance.fromUser.toJson(),
      'to_user': instance.toUser.toJson(),
      'send_by': instance.sendBy.toJson(),
      'send_to': instance.sendTo.toJson(),
      'sent_at': instance.sentAt.toIso8601String(),
      'is_unread': instance.isUnread,
      'attachment': instance.attachment.toJson(),
    };
