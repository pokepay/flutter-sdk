import 'package:json_annotation/json_annotation.dart';

part 'account_balance.g.dart';

@JsonSerializable()
class AccountBalance {
  final DateTime expiresAt;
  final double moneyAmount;
  final double pointAmount;

  AccountBalance({
    required this.expiresAt,
    required this.moneyAmount,
    required this.pointAmount,
  });

  factory AccountBalance.fromJson(Map<String, dynamic> json) => _$AccountBalanceFromJson(json);

  Map<String, dynamic> toJson() => _$AccountBalanceToJson(this);
}
