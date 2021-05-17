import 'package:json_annotation/json_annotation.dart';

import '../responses.dart';

part 'message_unread_count.g.dart';

@JsonSerializable()
class MessageUnreadCount extends Response {
  @JsonKey(nullable: false)
  final int count;

  MessageUnreadCount({
    this.count = 0,
  });

  factory MessageUnreadCount.fromJson(Map<String, dynamic> json) =>
      _$MessageUnreadCountFromJson(json);
  Map<String, dynamic> toJson() => _$MessageUnreadCountToJson(this);
}
