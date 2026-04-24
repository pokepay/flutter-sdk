import 'package:json_annotation/json_annotation.dart';
import 'account.dart';
import 'user_transaction.dart';

part 'seven_atm_session.g.dart';

@JsonSerializable()
class SevenAtmSession {
  final String qrInfo;
  final double amount;
  final Account account;
  final UserTransaction? transaction;

  SevenAtmSession({
    required this.qrInfo,
    required this.amount,
    required this.account,
    this.transaction,
  });

  factory SevenAtmSession.fromJson(Map<String, dynamic> json) =>
      _$SevenAtmSessionFromJson(json);

  Map<String, dynamic> toJson() => _$SevenAtmSessionToJson(this);

  @override
  String toString() => this.toJson().toString();
}
