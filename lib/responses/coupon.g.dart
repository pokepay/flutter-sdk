// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coupon _$CouponFromJson(Map<String, dynamic> json) {
  return Coupon(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    discountAmount: json['discount_amount'] as int,
    discountPercentage: json['discount_percentage'] as int,
    startsAt: DateTime.parse(json['starts_at'] as String),
    endsAt: DateTime.parse(json['ends_at'] as String),
    displayStartsAt: DateTime.parse(json['display_starts_at'] as String),
    displayEndsAt: DateTime.parse(json['display_ends_at'] as String),
    usageLimit: json['usage_limit'] as int,
    minAmount: json['min_amount'] as int,
    isShopSpecified: json['is_shop_specified'] as bool,
    isDisabled: json['is_disabled'] as bool,
    isHidden: json['is_hidden'] as bool,
    couponImage: json['coupon_image'] as String,
  );
}

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'discount_amount': instance.discountAmount,
      'discount_percentage': instance.discountPercentage,
      'starts_at': instance.startsAt!.toIso8601String(),
      'ends_at': instance.endsAt!.toIso8601String(),
      'display_starts_at': instance.displayStartsAt!.toIso8601String(),
      'display_ends_at': instance.displayEndsAt!.toIso8601String(),
      'usage_limit': instance.usageLimit,
      'min_amount': instance.minAmount,
      'is_shop_specified': instance.isShopSpecified,
      'is_disabled': instance.isDisabled,
      'is_hidden': instance.isHidden,
      'coupon_image': instance.couponImage,
    };
