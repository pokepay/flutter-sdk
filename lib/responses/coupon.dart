import 'package:json_annotation/json_annotation.dart';

part 'coupon.g.dart';

@JsonSerializable()
class Coupon {
  final String id;
  final String name;
  final String description;
  final int? discountAmount;
  final int? discountPercentage;
  final DateTime startsAt;
  final DateTime endsAt;
  final DateTime displayStartsAt;
  final DateTime displayEndsAt;
  final int? usageLimit;
  final int? minAmount;
  final bool isShopSpecified;
  final bool isDisabled;
  final bool isHidden;
  final String? couponImage;

  Coupon({
    required this.id,
    required this.name,
    required this.description,
    this.discountAmount,
    this.discountPercentage,
    required this.startsAt,
    required this.endsAt,
    required this.displayStartsAt,
    required this.displayEndsAt,
    this.usageLimit,
    this.minAmount,
    required this.isShopSpecified,
    required this.isDisabled,
    required this.isHidden,
    this.couponImage,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);

  Map<String, dynamic> toJson() => _$CouponToJson(this);
}
