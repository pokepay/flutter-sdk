import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../responses.dart';

part 'account_balance.g.dart';

@JsonSerializable()
class AccountBalance extends Response {
  @JsonKey(nullable: false)
  final DateTime expiresAt;
  @JsonKey(nullable: false)
  final double moneyAmount;
  @JsonKey(nullable: false)
  final double pointAmount;

  AccountBalance({
    @required this.expiresAt,
    @required this.moneyAmount,
    @required this.pointAmount,
  });

  factory AccountBalance.fromJson(Map<String, dynamic> json) =>
      _$AccountBalanceFromJson(json);
  Map<String, dynamic> toJson() => _$AccountBalanceToJson(this);
}
