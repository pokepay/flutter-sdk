
import '/responses.dart';
import '/responses/coupon.dart';

part 'coupon_detail.g.dart';


class CouponDetail extends Coupon {

  final String? receivedAt;
  final int usageCount;
  final List<User> availableShops;

  CouponDetail({
    this.receivedAt,
    required this.usageCount,
    required this.availableShops,
  });

  factory CouponDetail.fromJson(Map<String, dynamic> json) => _$CouponDetailFromJson(json);
  Map<String, dynamic> toJson() => _$CouponDetailToJson(this);
}