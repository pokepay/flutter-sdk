import 'package:json_annotation/json_annotation.dart';

import 'message.dart';

part 'paginated_messages.g.dart';

@JsonSerializable()
class PaginatedMessages {
  final int? perPage;
  final int? count;
  final String? next;
  final String? prev;
  final List<Message> items;

  PaginatedMessages({
    this.perPage,
    this.count,
    this.next,
    this.prev,
    required this.items,
  });

  factory PaginatedMessages.fromJson(Map<String, dynamic> json) => _$PaginatedMessagesFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedMessagesToJson(this);

  @override
  String toString() => this.toJson().toString();
}
