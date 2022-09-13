// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_accounts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedAccounts _$PaginatedAccountsFromJson(Map<String, dynamic> json) =>
    PaginatedAccounts(
      perPage: json['per_page'] as int?,
      count: json['count'] as int?,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedAccountsToJson(PaginatedAccounts instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'count': instance.count,
      'next': instance.next,
      'prev': instance.prev,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
