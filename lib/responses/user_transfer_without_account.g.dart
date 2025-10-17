// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_transfer_without_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTransferWithoutAccount _$UserTransferWithoutAccountFromJson(
        Map<String, dynamic> json) =>
    UserTransferWithoutAccount(
      id: json['id'] as String,
      type: json['type'] as String,
      amount: (json['amount'] as num?)?.toDouble(),
      description: json['description'] as String,
      doneAt: json['done_at'] as String,
      moneyAmount: (json['money_amount'] as num?)?.toDouble(),
      pointAmount: (json['point_amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserTransferWithoutAccountToJson(
        UserTransferWithoutAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'amount': instance.amount,
      'description': instance.description,
      'done_at': instance.doneAt,
      'money_amount': instance.moneyAmount,
      'point_amount': instance.pointAmount,
    };
