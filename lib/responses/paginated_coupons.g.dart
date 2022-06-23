// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_coupons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedCoupons _$PaginatedCouponsFromJson(Map<String, dynamic> json) {
  return PaginatedCoupons(
    perPage: json['per_page'] as int,
    count: json['count'] as int,
    next: json['next'] as String,
    prev: json['prev'] as String,
    items: (json['items'] as List).map((e) => Coupon.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

Map<String, dynamic> _$PaginatedCouponsToJson(PaginatedCoupons instance) => <String, dynamic>{
      'per_page': instance.perPage,
      'count': instance.count,
      'next': instance.next,
      'prev': instance.prev,
      'items': instance.items,
    };
