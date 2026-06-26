// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_user_tag_group_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedUserTagGroupItems _$PaginatedUserTagGroupItemsFromJson(
        Map<String, dynamic> json) =>
    PaginatedUserTagGroupItems(
      perPage: json['per_page'] as int,
      count: json['count'] as int,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => UserTagGroupItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedUserTagGroupItemsToJson(
        PaginatedUserTagGroupItems instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'count': instance.count,
      'next': instance.next,
      'prev': instance.prev,
      'items': instance.items,
    };
