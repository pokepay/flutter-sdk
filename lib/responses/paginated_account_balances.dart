import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../responses.dart';

part 'paginated_account_balances.g.dart';

@JsonSerializable()
class PaginatedAccountBalances extends Response {
  final int perPage;
  final int count;
  final String next;
  final String prev;
  @JsonKey(nullable: false)
  final List<AccountBalance> items;

  PaginatedAccountBalances({
    @required this.perPage,
    @required this.count,
    this.next,
    this.prev,
    @required this.items,
  });

  factory PaginatedAccountBalances.fromJson(Map<String, dynamic> json) =>
      _$PaginatedAccountBalancesFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedAccountBalancesToJson(this);
}
