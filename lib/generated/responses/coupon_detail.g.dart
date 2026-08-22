// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponDetail _$CouponDetailFromJson(Map<String, dynamic> json) => CouponDetail(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      discountAmount: (json['discount_amount'] as num?)?.toDouble(),
      discountPercentage: (json['discount_percentage'] as num?)?.toDouble(),
      startsAt: DateTime.parse(json['starts_at'] as String),
      endsAt: DateTime.parse(json['ends_at'] as String),
      displayStartsAt: DateTime.parse(json['display_starts_at'] as String),
      displayEndsAt: DateTime.parse(json['display_ends_at'] as String),
      usageLimit: (json['usage_limit'] as num?)?.toDouble(),
      minAmount: (json['min_amount'] as num?)?.toDouble(),
      isShopSpecified: json['is_shop_specified'] as bool,
      isDisabled: json['is_disabled'] as bool,
      isHidden: json['is_hidden'] as bool,
      couponImage: json['coupon_image'] as String?,
      receivedAt: json['received_at'] == null
          ? null
          : DateTime.parse(json['received_at'] as String),
      usageCount: (json['usage_count'] as num).toDouble(),
      availableShops: (json['available_shops'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CouponDetailToJson(CouponDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'discount_amount': instance.discountAmount,
      'discount_percentage': instance.discountPercentage,
      'starts_at': instance.startsAt.toIso8601String(),
      'ends_at': instance.endsAt.toIso8601String(),
      'display_starts_at': instance.displayStartsAt.toIso8601String(),
      'display_ends_at': instance.displayEndsAt.toIso8601String(),
      'usage_limit': instance.usageLimit,
      'min_amount': instance.minAmount,
      'is_shop_specified': instance.isShopSpecified,
      'is_disabled': instance.isDisabled,
      'is_hidden': instance.isHidden,
      'coupon_image': instance.couponImage,
      'received_at': instance.receivedAt?.toIso8601String(),
      'usage_count': instance.usageCount,
      'available_shops': instance.availableShops,
    };
