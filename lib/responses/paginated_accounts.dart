import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../responses.dart';

part 'paginated_accounts.g.dart';

@JsonSerializable()
class PaginatedAccounts extends Response {
  final int perPage;
  final int count;
  final String next;
  final String prev;
  @JsonKey(nullable: false)
  final List<Account> items;

  PaginatedAccounts({
    @required this.perPage,
    @required this.count,
    this.next,
    this.prev,
    @required this.items,
  });

  factory PaginatedAccounts.fromJson(Map<String, dynamic> json) =>
      _$PaginatedAccountsFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedAccountsToJson(this);
}
