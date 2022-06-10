
import 'package:meta/meta.dart';

import '../responses.dart';

part 'paginated_accounts.g.dart';


class PaginatedAccounts extends Response {
  final int perPage;
  final int count;
  final String? next;
  final String? prev;
  final List<Account>? items;

  PaginatedAccounts({
    required this.perPage,
    required this.count,
    this.next,
    this.prev,
    required this.items,
  });

  factory PaginatedAccounts.fromJson(Map<String, dynamic> json) =>
      _$PaginatedAccountsFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedAccountsToJson(this);
}
