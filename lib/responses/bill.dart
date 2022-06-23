import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_flutter_sdk/responses/private_money.dart';
import 'package:pokepay_flutter_sdk/responses/user.dart';

part 'bill.g.dart';

@JsonSerializable()
class Bill {
  final String id;
  final double? amount;
  final String description;
  final User user;
  final PrivateMoney privateMoney;
  final bool? isOnetime;
  final bool? isDisabled;
  final String token;
  final double? minAmount;
  final double? maxAmount;

  Bill({
    required this.id,
    this.amount,
    required this.description,
    required this.user,
    required this.privateMoney,
    this.isOnetime,
    this.isDisabled,
    required this.token,
    this.minAmount,
    this.maxAmount,
  });

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);

  Map<String, dynamic> toJson() => _$BillToJson(this);
}
