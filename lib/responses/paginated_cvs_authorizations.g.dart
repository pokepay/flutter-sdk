// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_cvs_authorizations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedCvsAuthorizations _$PaginatedCvsAuthorizationsFromJson(
        Map<String, dynamic> json) =>
    PaginatedCvsAuthorizations(
      perPage: json['per_page'] as int,
      count: json['count'] as int,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => CvsAuthorization.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedCvsAuthorizationsToJson(
        PaginatedCvsAuthorizations instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'count': instance.count,
      'next': instance.next,
      'prev': instance.prev,
      'items': instance.items,
    };
