import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_flutter_sdk/responses/private_money.dart';

part 'paginated_private_moneys.g.dart';

@JsonSerializable()
class PaginatedPrivateMoneys {
  final int? perPage;
  final int? count;
  final String? next;
  final String? prev;
  final List<PrivateMoney> items;

  PaginatedPrivateMoneys({
    this.perPage,
    this.count,
    this.next,
    this.prev,
    required this.items,
  });

  factory PaginatedPrivateMoneys.fromJson(Map<String, dynamic> json) => _$PaginatedPrivateMoneysFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedPrivateMoneysToJson(this);

  @override
  String toString() => this.toJson().toString();
}
