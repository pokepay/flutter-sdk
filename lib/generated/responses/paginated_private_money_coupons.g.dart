// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_private_money_coupons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedPrivateMoneyCoupons _$PaginatedPrivateMoneyCouponsFromJson(
        Map<String, dynamic> json) =>
    PaginatedPrivateMoneyCoupons(
      perPage: (json['per_page'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => Coupon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedPrivateMoneyCouponsToJson(
        PaginatedPrivateMoneyCoupons instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'count': instance.count,
      'next': instance.next,
      'prev': instance.prev,
      'items': instance.items,
    };
