// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_transfers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedTransfers _$PaginatedTransfersFromJson(Map<String, dynamic> json) =>
    PaginatedTransfers(
      perPage: json['per_page'] as int?,
      count: json['count'] as int?,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => UserTransfer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedTransfersToJson(PaginatedTransfers instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'count': instance.count,
      'next': instance.next,
      'prev': instance.prev,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
