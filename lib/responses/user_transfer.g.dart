// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTransfer _$UserTransferFromJson(Map<String, dynamic> json) => UserTransfer(
      id: json['id'] as String,
      type: json['type'] as String,
      amount: (json['amount'] as num?)?.toDouble(),
      balance: (json['balance'] as num?)?.toDouble(),
      description: json['description'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      account: json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      doneAt: json['done_at'] as String,
      moneyAmount: (json['money_amount'] as num?)?.toDouble(),
      pointAmount: (json['point_amount'] as num?)?.toDouble(),
      transactionId: json['transaction_id'] as String?,
    );

Map<String, dynamic> _$UserTransferToJson(UserTransfer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'amount': instance.amount,
      'balance': instance.balance,
      'description': instance.description,
      'user': instance.user?.toJson(),
      'account': instance.account?.toJson(),
      'done_at': instance.doneAt,
      'money_amount': instance.moneyAmount,
      'point_amount': instance.pointAmount,
      'transaction_id': instance.transactionId,
    };
