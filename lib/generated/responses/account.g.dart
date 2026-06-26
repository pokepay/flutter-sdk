// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['id'] as String,
      name: json['name'] as String,
      balance: (json['balance'] as num).toDouble(),
      moneyBalance: (json['money_balance'] as num).toDouble(),
      pointBalance: (json['point_balance'] as num).toDouble(),
      pointDebt: (json['point_debt'] as num).toDouble(),
      isSuspended: json['is_suspended'] as bool,
      privateMoney:
          PrivateMoney.fromJson(json['private_money'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'money_balance': instance.moneyBalance,
      'point_balance': instance.pointBalance,
      'point_debt': instance.pointDebt,
      'is_suspended': instance.isSuspended,
      'private_money': instance.privateMoney,
    };
