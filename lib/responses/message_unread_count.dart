

import '../responses.dart';

part 'message_unread_count.g.dart';


class MessageUnreadCount extends Response {
  
  final int count;

  MessageUnreadCount({
    this.count = 0,
  });

  factory MessageUnreadCount.fromJson(Map<String, dynamic> json) =>
      _$MessageUnreadCountFromJson(json);
  Map<String, dynamic> toJson() => _$MessageUnreadCountToJson(this);
}
