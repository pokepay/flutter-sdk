import 'package:json_annotation/json_annotation.dart';
import 'private_money.dart';
import 'user.dart';

part 'bill_with_additional_private_moneys.g.dart';

@JsonSerializable()
class BillWithAdditionalPrivateMoneys {
  final String id;
  final double? amount;
  final String description;
  final User user;
  final PrivateMoney privateMoney;
  final bool isOnetime;
  final bool isDisabled;
  final String token;
  final double? minAmount;
  final double? maxAmount;
  final List<PrivateMoney> additionalPrivateMoneys;

  BillWithAdditionalPrivateMoneys({
    required this.id,
    this.amount,
    required this.description,
    required this.user,
    required this.privateMoney,
    required this.isOnetime,
    required this.isDisabled,
    required this.token,
    this.minAmount,
    this.maxAmount,
    required this.additionalPrivateMoneys,
  });

  factory BillWithAdditionalPrivateMoneys.fromJson(Map<String, dynamic> json) =>
      _$BillWithAdditionalPrivateMoneysFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BillWithAdditionalPrivateMoneysToJson(this);

  @override
  String toString() => this.toJson().toString();
}
