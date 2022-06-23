import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_flutter_sdk/responses/user.dart';

part 'coupon_detail.g.dart';

@JsonSerializable()
class CouponDetail {
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
