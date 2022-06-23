// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponDetail _$CouponDetailFromJson(Map<String, dynamic> json) {
  return CouponDetail(
    receivedAt: json['received_at'] as String,
    usageCount: json['usage_count'] as int,
    availableShops: (json['available_shops'] as List).map((e) => User.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

Map<String, dynamic> _$CouponDetailToJson(CouponDetail instance) => <String, dynamic>{
      'received_at': instance.receivedAt,
      'usage_count': instance.usageCount,
      'available_shops': instance.availableShops,
    };
