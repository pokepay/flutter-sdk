import 'package:json_annotation/json_annotation.dart';
import 'user_transfer.dart';

part 'paginated_transfers.g.dart';

@JsonSerializable()
class PaginatedTransfers {
  final int? perPage;
  final int? count;
  final String? next;
  final String? prev;
  final List<UserTransfer> items;

  PaginatedTransfers({
    this.perPage,
    this.count,
    this.next,
    this.prev,
    required this.items,
  });

  factory PaginatedTransfers.fromJson(Map<String, dynamic> json) =>
      _$PaginatedTransfersFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedTransfersToJson(this);

  @override
  String toString() => this.toJson().toString();
}
