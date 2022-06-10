
import 'package:meta/meta.dart';

import '../custom_datetime_converter.dart';
import '../responses.dart';

part 'message.g.dart';


@CustomDateTimeConverter()
class Message extends Response {
  
  final String id;
  
  final String subject;
  
  final String body;
  
  final User fromUser;
  
  final User toUser;
  
  final User sendBy;
  
  final User sendTo;
  
  final DateTime sentAt;
  
  final bool isUnread;
  
  final MessageAttachment attachment;

  Message({
    required this.id,
    required this.subject,
    required this.body,
    required this.fromUser,
    required this.toUser,
    required this.sendBy,
    required this.sendTo,
    required this.sentAt,
    required this.isUnread,
    required this.attachment,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
