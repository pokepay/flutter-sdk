// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_account_transfers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedAccountTransfers _$PaginatedAccountTransfersFromJson(
        Map<String, dynamic> json) =>
    PaginatedAccountTransfers(
      perPage: (json['per_page'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => UserTransfer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedAccountTransfersToJson(
        PaginatedAccountTransfers instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'count': instance.count,
      'next': instance.next,
      'prev': instance.prev,
      'items': instance.items,
    };
