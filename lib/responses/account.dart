import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_flutter_sdk/responses/private_money.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final String id;
  final String name;
  final double? balance;
  final double? moneyBalance;
  final double? pointBalance;
  final bool? isSuspended;
  final PrivateMoney privateMoney;
  final DateTime? nearestExpiresAt;

  Account({
    required this.id,
    required this.name,
    this.balance,
    this.moneyBalance,
    this.pointBalance,
    this.isSuspended,
    required this.privateMoney,
    this.nearestExpiresAt,
  });

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
