import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_flutter_sdk/responses/user.dart';
import 'package:pokepay_flutter_sdk/responses/user_transfer.dart';

import 'account.dart';

part 'user_transaction.g.dart';

@JsonSerializable()
class UserTransaction {
  final String id;
  final String type;
  final bool isModified;
  final User user;
  final double? balance;
  final double? customerBalance;
  final double? amount;
  final double? moneyAmount;
  final double? pointAmount;
  final Account account;
  final String description;
  final String doneAt;
  final List<UserTransfer>? transfers;

  UserTransaction({
    required this.id,
    required this.type,
    required this.isModified,
    required this.user,
    this.balance,
    this.customerBalance,
    this.amount,
    this.moneyAmount,
    this.pointAmount,
    required this.account,
    required this.description,
    required this.doneAt,
    this.transfers,
  });

  factory UserTransaction.fromJson(Map<String, dynamic> json) => _$UserTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$UserTransactionToJson(this);
}
