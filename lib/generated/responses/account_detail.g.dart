// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetail _$AccountDetailFromJson(Map<String, dynamic> json) =>
    AccountDetail(
      id: json['id'] as String,
      name: json['name'] as String,
      balance: (json['balance'] as num).toDouble(),
      moneyBalance: (json['money_balance'] as num).toDouble(),
      pointBalance: (json['point_balance'] as num).toDouble(),
      pointDebt: (json['point_debt'] as num).toDouble(),
      isSuspended: json['is_suspended'] as bool,
      status: json['status'] as String,
      privateMoney: PrivateMoneyDetail.fromJson(
          json['private_money'] as Map<String, dynamic>),
      nearestExpiresAt: json['nearest_expires_at'] == null
          ? null
          : DateTime.parse(json['nearest_expires_at'] as String),
    );

Map<String, dynamic> _$AccountDetailToJson(AccountDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'money_balance': instance.moneyBalance,
      'point_balance': instance.pointBalance,
      'point_debt': instance.pointDebt,
      'is_suspended': instance.isSuspended,
      'status': instance.status,
      'private_money': instance.privateMoney,
      'nearest_expires_at': instance.nearestExpiresAt?.toIso8601String(),
    };
