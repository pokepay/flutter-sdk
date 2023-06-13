import 'package:json_annotation/json_annotation.dart';
import 'coupon.dart';
import 'user.dart';

part 'coupon_detail.g.dart';

@JsonSerializable()
class CouponDetail extends Coupon {
  final String? receivedAt;
  final int usageCount;
  final List<User> availableShops;

  CouponDetail({
    required String id,
    required String name,
    required String description,
    int? discountAmount,
    int? discountPercentage,
    required DateTime startsAt,
    required DateTime endsAt,
    required DateTime displayStartsAt,
    required DateTime displayEndsAt,
    int? usageLimit,
    int? minAmount,
    required bool isShopSpecified,
    required bool isDisabled,
    required bool isHidden,
    String? couponImage,
    this.receivedAt,
    required this.usageCount,
    required this.availableShops,
  }) : super(
            id: id,
            name: name,
            description: description,
            discountAmount: discountAmount,
            discountPercentage: discountPercentage,
            startsAt: startsAt,
            endsAt: endsAt,
            displayStartsAt: displayStartsAt,
            displayEndsAt: displayEndsAt,
            usageLimit: usageCount,
            minAmount: minAmount,
            isShopSpecified: isShopSpecified,
            isDisabled: isDisabled,
            isHidden: isHidden,
            couponImage: couponImage);

  factory CouponDetail.fromJson(Map<String, dynamic> json) =>
      _$CouponDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CouponDetailToJson(this);

  @override
  String toString() => this.toJson().toString();
}
