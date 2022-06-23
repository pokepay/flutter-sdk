import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_flutter_sdk/responses/user_transfer.dart';

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

  factory PaginatedTransfers.fromJson(Map<String, dynamic> json) => PaginatedTransfers(
        perPage: (json['perPage'] as num).toInt(),
        count: (json['count'] as num).toInt(),
        next: json['next'] as String,
        prev: json['prev'] as String,
        items: (json['items'] as List).map((e) => UserTransfer.fromJson(e as Map<String, dynamic>)).toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'perPage': this.perPage,
        'count': this.count,
        'next': this.next,
        'prev': this.prev,
        'items': this.items,
      };
}
