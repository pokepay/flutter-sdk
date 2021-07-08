import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../responses.dart';

part 'paginated_private_moneys.g.dart';

@JsonSerializable()
class PaginatedPrivateMoneys extends Response {
  final int perPage;
  final int count;
  final String next;
  final String prev;
  @JsonKey(nullable: false)
  final List<PrivateMoney> items;

  PaginatedPrivateMoneys({
    @required this.perPage,
    @required this.count,
    this.next,
    this.prev,
    @required this.items,
  });

  factory PaginatedPrivateMoneys.fromJson(Map<String, dynamic> json) =>
      _$PaginatedPrivateMoneysFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedPrivateMoneysToJson(this);
}
