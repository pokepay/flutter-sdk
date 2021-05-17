import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../custom_datetime_converter.dart';
import '../responses.dart';

part 'message.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class Message extends Response {
  @JsonKey(nullable: false)
  final String id;
  @JsonKey(nullable: false)
  final String subject;
  @JsonKey(nullable: false)
  final String body;
  @JsonKey(nullable: false)
  final User fromUser;
  @JsonKey(nullable: false)
  final User toUser;
  @JsonKey(nullable: false)
  final User sendBy;
  @JsonKey(nullable: false)
  final User sendTo;
  @JsonKey(nullable: false)
  final DateTime sentAt;
  @JsonKey(nullable: false)
  final bool isUnread;
  @JsonKey(nullable: false)
  final MessageAttachment attachment;

  Message({
    @required this.id,
    @required this.subject,
    @required this.body,
    @required this.fromUser,
    @required this.toUser,
    @required this.sendBy,
    @required this.sendTo,
    @required this.sentAt,
    @required this.isUnread,
    @required this.attachment,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
