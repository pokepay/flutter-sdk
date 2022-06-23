import 'package:json_annotation/json_annotation.dart';

import 'coupon.dart';

part 'paginated_coupons.g.dart';

@JsonSerializable()
class PaginatedCoupons {
  final int? perPage;
  final int? count;
  final String? next;
  final String? prev;
  final List<Coupon> items;

  PaginatedCoupons({
    this.perPage,
    this.count,
    this.next,
    this.prev,
    required this.items,
  });

  factory PaginatedCoupons.fromJson(Map<String, dynamic> json) => _$PaginatedCouponsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedCouponsToJson(this);
}
