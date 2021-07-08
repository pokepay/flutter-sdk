import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../responses.dart';

part 'paginated_messages.g.dart';

@JsonSerializable()
class PaginatedMessages extends Response {
  final int perPage;
  final int count;
  final String next;
  final String prev;
  @JsonKey(nullable: false)
  final List<Message> items;

  PaginatedMessages({
    @required this.perPage,
    @required this.count,
    this.next,
    this.prev,
    @required this.items,
  });

  factory PaginatedMessages.fromJson(Map<String, dynamic> json) =>
      _$PaginatedMessagesFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedMessagesToJson(this);
}
