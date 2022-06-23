import 'package:json_annotation/json_annotation.dart';

import 'account.dart';

part 'paginated_accounts.g.dart';

@JsonSerializable()
class PaginatedAccounts {
  final int? perPage;
  final int? count;
  final String? next;
  final String? prev;
  final List<Account> items;

  PaginatedAccounts({
    this.perPage,
    this.count,
    this.next,
    this.prev,
    required this.items,
  });

  factory PaginatedAccounts.fromJson(Map<String, dynamic> json) => _$PaginatedAccountsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedAccountsToJson(this);
}
