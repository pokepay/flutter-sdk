// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_private_moneys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedPrivateMoneys _$PaginatedPrivateMoneysFromJson(Map<String, dynamic> json) => PaginatedPrivateMoneys(
      perPage: json['per_page'] as int?,
      count: json['count'] as int?,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      items: (json['items'] as List<dynamic>).map((e) => PrivateMoney.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$PaginatedPrivateMoneysToJson(PaginatedPrivateMoneys instance) => <String, dynamic>{
      'per_page': instance.perPage,
      'count': instance.count,
      'next': instance.next,
      'prev': instance.prev,
      'items': instance.items,
    };
