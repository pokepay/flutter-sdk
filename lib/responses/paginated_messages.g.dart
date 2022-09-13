// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedMessages _$PaginatedMessagesFromJson(Map<String, dynamic> json) =>
    PaginatedMessages(
      perPage: json['per_page'] as int?,
      count: json['count'] as int?,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedMessagesToJson(PaginatedMessages instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'count': instance.count,
      'next': instance.next,
      'prev': instance.prev,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
