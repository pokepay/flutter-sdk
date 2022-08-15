import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_flutter_sdk/responses/user.dart';

import 'account.dart';

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

  factory UserTransfer.fromJson(Map<String, dynamic> json) => UserTransfer(
        id: json['id'] as String,
        type: json['type'] as String,
        description: json['description'] as String,
        doneAt: json['doneAt'] as String,
        amount: (json['amount'] as num).toDouble(),
        balance: (json['balance'] as num).toDouble(),
        user: User.fromJson(json['user'] as Map<String, dynamic>),
        account: Account.fromJson(json['account'] as Map<String, dynamic>),
        moneyAmount: (json['moneyAmount'] as num).toDouble(),
        pointAmount: (json['pointAmount'] as num).toDouble(),
        transactionId: json['transactionId'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'type': this.type,
        'amount': this.amount,
        'balance': this.balance,
        'description': this.description,
        'user': this.user?.toJson(),
        'account': this.account?.toJson(),
        'doneAt': this.doneAt,
        'moneyAmount': this.moneyAmount,
        'pointAmount': this.pointAmount,
        'transactionId': this.transactionId,
      };
}
