// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTransfer _$UserTransferFromJson(Map<String, dynamic> json) => UserTransfer(
      id: json['id'] as String,
      transactionId: json['transaction_id'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      balance: (json['balance'] as num).toDouble(),
      amount: (json['amount'] as num).toDouble(),
      moneyAmount: (json['money_amount'] as num).toDouble(),
      pointAmount: (json['point_amount'] as num).toDouble(),
      account: Account.fromJson(json['account'] as Map<String, dynamic>),
      description: json['description'] as String,
      doneAt: DateTime.parse(json['done_at'] as String),
      type: json['type'] as String,
    );

Map<String, dynamic> _$UserTransferToJson(UserTransfer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transaction_id': instance.transactionId,
      'user': instance.user,
      'balance': instance.balance,
      'amount': instance.amount,
      'money_amount': instance.moneyAmount,
      'point_amount': instance.pointAmount,
      'account': instance.account,
      'description': instance.description,
      'done_at': instance.doneAt.toIso8601String(),
      'type': instance.type,
    };
