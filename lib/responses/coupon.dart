import 'package:json_annotation/json_annotation.dart';

part 'coupon.g.dart';

@JsonSerializable()
class Coupon {
  @JsonKey(nullable: false)
  final String id;
  @JsonKey(nullable: false)
  final String name;
  @JsonKey(nullable: false)
  final String description;
  final int discountAmount;
  final int discountPercentage;
  @JsonKey(nullable: false)
  final DateTime startsAt;
  @JsonKey(nullable: false)
  final DateTime endsAt;
  @JsonKey(nullable: false)
  final DateTime displayStartsAt;
  @JsonKey(nullable: false)
  final DateTime displayEndsAt;
  final int usageLimit;
  final int minAmount;
  @JsonKey(nullable: false)
  final bool    isShopSpecified;
  @JsonKey(nullable: false)
  final bool    isDisabled;
  @JsonKey(nullable: false)
  final bool    isHidden;
  final String couponImage;

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