import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_flutter_sdk/responses/user.dart';

import 'account.dart';
part 'user_transfer.g.dart';

@JsonSerializable()
class UserTransfer {
  final String id;
  final String type;
  final double? amount;
  final double? balance;
  final String description;
  final User? user;
  final Account? account;
  final String doneAt;
  final double? moneyAmount;
  final double? pointAmount;
  final String? transactionId;

  UserTransfer({
    required this.id,
    required this.type,
    this.amount,
    this.balance,
    required this.description,
    this.user,
    this.account,
    required this.doneAt,
    this.moneyAmount,
    this.pointAmount,
    this.transactionId,
  });

  factory UserTransfer.fromJson(Map<String, dynamic> json) => _$UserTransferFromJson(json);

  Map<String, dynamic> toJson() => _$UserTransferToJson(this);

  @override
  String toString() => this.toJson().toString();
}
