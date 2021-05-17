// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_account_balances.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedAccountBalances _$PaginatedAccountBalancesFromJson(
    Map<String, dynamic> json) {
  return PaginatedAccountBalances(
    perPage: json['per_page'] as int,
    count: json['count'] as int,
    next: json['next'] as String,
    prev: json['prev'] as String,
    items: (json['items'] as List)
        .map((e) => AccountBalance.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PaginatedAccountBalancesToJson(
        PaginatedAccountBalances instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'count': instance.count,
      'next': instance.next,
      'prev': instance.prev,
      'items': instance.items,
    };
