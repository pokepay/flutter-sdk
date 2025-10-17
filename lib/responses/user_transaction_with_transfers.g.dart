// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_transaction_with_transfers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTransactionWithTransfers _$UserTransactionWithTransfersFromJson(
        Map<String, dynamic> json) =>
    UserTransactionWithTransfers(
      id: json['id'] as String,
      type: json['type'] as String,
      isModified: json['is_modified'] as bool,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      balance: (json['balance'] as num?)?.toDouble(),
      amount: (json['amount'] as num?)?.toDouble(),
      moneyAmount: (json['money_amount'] as num?)?.toDouble(),
      pointAmount: (json['point_amount'] as num?)?.toDouble(),
      account: Account.fromJson(json['account'] as Map<String, dynamic>),
      description: json['description'] as String,
      doneAt: json['done_at'] as String,
      transfers: (json['transfers'] as List<dynamic>?)
          ?.map((e) =>
              UserTransferWithoutAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserTransactionWithTransfersToJson(
        UserTransactionWithTransfers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'is_modified': instance.isModified,
      'user': instance.user.toJson(),
      'balance': instance.balance,
      'amount': instance.amount,
      'money_amount': instance.moneyAmount,
      'point_amount': instance.pointAmount,
      'account': instance.account.toJson(),
      'description': instance.description,
      'done_at': instance.doneAt,
      'transfers': instance.transfers?.map((e) => e.toJson()).toList(),
    };
