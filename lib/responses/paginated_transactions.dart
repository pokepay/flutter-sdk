
import 'package:meta/meta.dart';

import '../responses.dart';

part 'paginated_transactions.g.dart';


class PaginatedTransactions extends Response {
  final int perPage;
  final int count;
  final String? next;
  final String? prev;
  final List<UserTransaction> items;

  PaginatedTransactions({
    required this.perPage,
    required this.count,
    this.next,
    this.prev,
    required this.items,
  });

  factory PaginatedTransactions.fromJson(Map<String, dynamic> json) =>
      _$PaginatedTransactionsFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedTransactionsToJson(this);
}
