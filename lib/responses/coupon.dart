

part 'coupon.g.dart';


class Coupon {
  
  final String? id;
  
  final String? name;
  
  final String? description;
  final int?discountAmount;
  final int?discountPercentage;
  
  final DateTime?startsAt;
  
  final DateTime?endsAt;
  
  final DateTime?displayStartsAt;
  
  final DateTime?displayEndsAt;
  final int?usageLimit;
  final int?minAmount;
  
  final bool?   isShopSpecified;
  
  final bool?   isDisabled;
  
  final bool?   isHidden;
  final String? couponImage;

  Coupon({
    this.id,
    this.name,
    this.description,
    this.discountAmount,
    this.discountPercentage,
    this.startsAt,
    this.endsAt,
    this.displayStartsAt,
    this.displayEndsAt,
    this.usageLimit,
    this.minAmount,
    this.isShopSpecified,
    this.isDisabled,
    this.isHidden,
    this.couponImage,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);
  Map<String, dynamic> toJson() => _$CouponToJson(this);
}