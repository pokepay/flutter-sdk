// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Check _$CheckFromJson(Map<String, dynamic> json) {
  return Check(
    id: json['id'] as String,
    amount: (json['amount'] as num).toDouble(),
    moneyAmount: (json['money_amount'] as num).toDouble(),
    pointAmount: (json['point_amount'] as num).toDouble(),
    description: json['description'] as String,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    privateMoney: PrivateMoney.fromJson(json['private_money'] as Map<String, dynamic>),
    isOnetime: json['is_onetime'] as bool,
    isDisabled: json['is_disabled'] as bool,
    expiresAt: const CustomDateTimeConverter().fromJson(json['expires_at'] as String),
    token: json['token'] as String,
    pointExpiresAt: const CustomDateTimeConverter().fromJson(json['point_expires_at'] as String),
    pointExpiresInDays: json['point_expires_in_days'] as int,
  );
}

Map<String, dynamic> _$CheckToJson(Check instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'money_amount': instance.moneyAmount,
      'point_amount': instance.pointAmount,
      'description': instance.description,
      'user': instance.user,
      'private_money': instance.privateMoney,
      'is_onetime': instance.isOnetime,
      'is_disabled': instance.isDisabled,
      'expires_at': const CustomDateTimeConverter().toJson(instance.expiresAt),
      'token': instance.token,
      if (instance.pointExpiresAt != null)
        'point_expires_at': const CustomDateTimeConverter().toJson(instance.pointExpiresAt!),
      'point_expires_in_days': instance.pointExpiresInDays,
    };
