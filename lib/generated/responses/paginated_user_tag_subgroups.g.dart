// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_user_tag_subgroups.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedUserTagSubgroups _$PaginatedUserTagSubgroupsFromJson(
        Map<String, dynamic> json) =>
    PaginatedUserTagSubgroups(
      perPage: (json['per_page'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => UserTagSubgroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedUserTagSubgroupsToJson(
        PaginatedUserTagSubgroups instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'count': instance.count,
      'next': instance.next,
      'prev': instance.prev,
      'items': instance.items,
    };
