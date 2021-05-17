// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_transactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedTransactions _$PaginatedTransactionsFromJson(
    Map<String, dynamic> json) {
  return PaginatedTransactions(
    perPage: json['per_page'] as int,
    count: json['count'] as int,
    next: json['next'] as String,
    prev: json['prev'] as String,
    items: (json['items'] as List)
        .map((e) => UserTransaction.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PaginatedTransactionsToJson(
        PaginatedTransactions instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'count': instance.count,
      'next': instance.next,
      'prev': instance.prev,
      'items': instance.items,
    };
