// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_credit_cards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedCreditCards _$PaginatedCreditCardsFromJson(
        Map<String, dynamic> json) =>
    PaginatedCreditCards(
      perPage: (json['per_page'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => CreditCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedCreditCardsToJson(
        PaginatedCreditCards instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'count': instance.count,
      'next': instance.next,
      'prev': instance.prev,
      'items': instance.items,
    };
