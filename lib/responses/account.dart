import 'package:json_annotation/json_annotation.dart';
import 'private_money.dart';

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
  final double? pointDebt;

  Account({
    required this.id,
    required this.name,
    this.balance,
    this.moneyBalance,
    this.pointBalance,
    this.isSuspended,
    required this.privateMoney,
    this.nearestExpiresAt,
    this.pointDebt,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  @override
  String toString() => this.toJson().toString();
}
