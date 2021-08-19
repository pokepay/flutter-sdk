import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_flutter_sdk/responses/coupon.dart';

part 'paginated_coupons.g.dart';

@JsonSerializable(explicitToJson: true)
class PaginatedCoupons {
  final int     perPage;
  final int     count;
  final String  next;
  final String  prev;
  @JsonKey(nullable: false)
  final List<Coupon> items;

  PaginatedCoupons({
    this.perPage,
    this.count,
    this.next,
    this.prev,
    this.items,
  });

  factory PaginatedCoupons.fromJson(Map<String, dynamic> json) => _$PaginatedCouponsFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedCouponsToJson(this);
}