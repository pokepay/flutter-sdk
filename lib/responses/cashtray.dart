import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_flutter_sdk/responses/private_money.dart';
import 'package:pokepay_flutter_sdk/responses/user.dart';
import 'package:pokepay_flutter_sdk/responses/user_transaction.dart';

import 'cashtray_attempt.dart';

part 'cashtray.g.dart';

@JsonSerializable()
class Cashtray {
  final String id;
  final double amount;
  final String description;
  final User user;
  final PrivateMoney privateMoney;
  final DateTime expiresAt;
  final DateTime? canceledAt;
  final String token;
  final CashtrayAttempt? attempt;
  final UserTransaction? transaction;

  Cashtray({
    required this.id,
    required this.amount,
    required this.description,
    required this.user,
    required this.privateMoney,
    required this.expiresAt,
    this.canceledAt,
    required this.token,
    this.attempt,
    this.transaction,
  });

  factory Cashtray.fromJson(Map<String, dynamic> json) => _$CashtrayFromJson(json);

  Map<String, dynamic> toJson() => _$CashtrayToJson(this);

  @override
  String toString() => this.toJson().toString();
}
