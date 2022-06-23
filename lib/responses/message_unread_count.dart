import 'package:json_annotation/json_annotation.dart';

part 'message_unread_count.g.dart';

@JsonSerializable()
class MessageUnreadCount {
  int count;

  MessageUnreadCount({
    required this.count,
  });

  factory MessageUnreadCount.fromJson(Map<String, dynamic> json) => _$MessageUnreadCountFromJson(json);

  Map<String, dynamic> toJson() => _$MessageUnreadCountToJson(this);
}
