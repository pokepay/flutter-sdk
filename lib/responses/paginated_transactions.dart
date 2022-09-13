import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_flutter_sdk/responses/user_transaction.dart';

part 'paginated_transactions.g.dart';

@JsonSerializable()
class PaginatedTransactions {
  final int? perPage;
  final int? count;
  final String? next;
  final String? prev;
  final List<UserTransaction> items;

  PaginatedTransactions({
    this.perPage,
    this.count,
    this.next,
    this.prev,
    required this.items,
  });

  factory PaginatedTransactions.fromJson(Map<String, dynamic> json) => _$PaginatedTransactionsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedTransactionsToJson(this);

  @override
  String toString() => this.toJson().toString();
}
