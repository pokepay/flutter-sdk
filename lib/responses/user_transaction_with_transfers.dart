import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_sdk/responses/user_transfer_without_account.dart';
import 'user.dart';

import 'account.dart';

part 'user_transaction_with_transfers.g.dart';

@JsonSerializable()
class UserTransactionWithTransfers {
  final String id;
  final String type;
  final bool isModified;
  final User user;
  final double? balance;
  final double? amount;
  final double? moneyAmount;
  final double? pointAmount;
  final Account account;
  final String description;
  final String doneAt;
  final List<UserTransferWithoutAccount>? transfers;

  UserTransactionWithTransfers({
    required this.id,
    required this.type,
    required this.isModified,
    required this.user,
    this.balance,
    this.amount,
    this.moneyAmount,
    this.pointAmount,
    required this.account,
    required this.description,
    required this.doneAt,
    this.transfers,
  });

  factory UserTransactionWithTransfers.fromJson(Map<String, dynamic> json) =>
      _$UserTransactionWithTransfersFromJson(json);

  Map<String, dynamic> toJson() => _$UserTransactionWithTransfersToJson(this);

  @override
  String toString() => this.toJson().toString();
}
