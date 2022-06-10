
import 'package:meta/meta.dart';

import '../responses.dart';

part 'paginated_messages.g.dart';


class PaginatedMessages extends Response {
  final int perPage;
  final int count;
  final String? next;
  final String? prev;

  final List<Message> items;

  PaginatedMessages({
    required this.perPage,
    required this.count,
    this.next,
    this.prev,
    required this.items,
  });

  factory PaginatedMessages.fromJson(Map<String, dynamic> json) =>
      _$PaginatedMessagesFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedMessagesToJson(this);
}
