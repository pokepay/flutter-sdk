import 'package:json_annotation/json_annotation.dart';
import 'private_money.dart';
import 'user.dart';

part 'check.g.dart';

@JsonSerializable()
class Check {
  final String id;
  final double amount;
  final double moneyAmount;
  final double pointAmount;
  final String description;
  final User user;
  final PrivateMoney privateMoney;
  final bool isOnetime;
  final bool isDisabled;
  final DateTime expiresAt;
  final DateTime? pointExpiresAt;
  final int? pointExpiresInDays;
  final String token;

  Check({
    required this.id,
    required this.amount,
    required this.moneyAmount,
    required this.pointAmount,
    required this.description,
    required this.user,
    required this.privateMoney,
    required this.isOnetime,
    required this.isDisabled,
    required this.expiresAt,
    this.pointExpiresAt,
    this.pointExpiresInDays,
    required this.token,
  });

  factory Check.fromJson(Map<String, dynamic> json) => _$CheckFromJson(json);

  Map<String, dynamic> toJson() => _$CheckToJson(this);

  @override
  String toString() => this.toJson().toString();
}
