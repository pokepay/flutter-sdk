// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountBalance _$AccountBalanceFromJson(Map<String, dynamic> json) {
  return AccountBalance(
    expiresAt: DateTime.parse(json['expires_at'] as String),
    moneyAmount: (json['money_amount'] as num).toDouble(),
    pointAmount: (json['point_amount'] as num).toDouble(),
  );
}

Map<String, dynamic> _$AccountBalanceToJson(AccountBalance instance) => <String, dynamic>{
      'expires_at': instance.expiresAt.toIso8601String(),
      'money_amount': instance.moneyAmount,
      'point_amount': instance.pointAmount,
    };
