import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

import '../responses.dart';

part 'bill.g.dart';

@JsonSerializable()
class Bill extends Response {
  @JsonKey(nullable: false)
  final String id;
  final double amount;
  @JsonKey(nullable: false)
  final String description;
  @JsonKey(nullable: false)
  final User user;
  @JsonKey(nullable: false)
  final PrivateMoney privateMoney;
  @JsonKey(nullable: false)
  final bool isOnetime;
  @JsonKey(nullable: false)
  final bool isDisabled;
  @JsonKey(nullable: false)
  final String token;
  final double minAmount;
  final double maxAmount;

  Bill({
    @required this.id,
    this.amount,
    @required this.description,
    @required this.user,
    @required this.privateMoney,
    @required this.isOnetime,
    @required this.isDisabled,
    @required this.token,
    this.minAmount,
    this.maxAmount,
  });

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);
  Map<String, dynamic> toJson() => _$BillToJson(this);
}
