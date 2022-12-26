// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Check _$CheckFromJson(Map<String, dynamic> json) => Check(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      moneyAmount: (json['money_amount'] as num).toDouble(),
      pointAmount: (json['point_amount'] as num).toDouble(),
      description: json['description'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      privateMoney:
          PrivateMoney.fromJson(json['private_money'] as Map<String, dynamic>),
      isOnetime: json['is_onetime'] as bool,
      isDisabled: json['is_disabled'] as bool,
      expiresAt: DateTime.parse(json['expires_at'] as String),
      pointExpiresAt: json['point_expires_at'] == null
          ? null
          : DateTime.parse(json['point_expires_at'] as String),
      pointExpiresInDays: json['point_expires_in_days'] as int?,
      token: json['token'] as String,
    );

Map<String, dynamic> _$CheckToJson(Check instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'money_amount': instance.moneyAmount,
      'point_amount': instance.pointAmount,
      'description': instance.description,
      'user': instance.user.toJson(),
      'private_money': instance.privateMoney.toJson(),
      'is_onetime': instance.isOnetime,
      'is_disabled': instance.isDisabled,
      'expires_at': instance.expiresAt.toIso8601String(),
      'point_expires_at': instance.pointExpiresAt?.toIso8601String(),
      'point_expires_in_days': instance.pointExpiresInDays,
      'token': instance.token,
    };
