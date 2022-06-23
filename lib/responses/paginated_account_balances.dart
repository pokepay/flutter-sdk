import 'package:json_annotation/json_annotation.dart';

import 'account_balance.dart';

part 'paginated_account_balances.g.dart';

@JsonSerializable()
class PaginatedAccountBalances {
  final int? perPage;
  final int? count;
  final String? next;
  final String? prev;
  final List<AccountBalance> items;

  PaginatedAccountBalances({
    this.perPage,
    this.count,
    this.next,
    this.prev,
    required this.items,
  });

  factory PaginatedAccountBalances.fromJson(Map<String, dynamic> json) => _$PaginatedAccountBalancesFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedAccountBalancesToJson(this);
}
