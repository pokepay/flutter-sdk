// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) {
  return Bill(
    id: json['id'] as String,
    amount: (json['amount'] as num)?.toDouble(),
    description: json['description'] as String,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    privateMoney:
        PrivateMoney.fromJson(json['private_money'] as Map<String, dynamic>),
    isOnetime: json['is_onetime'] as bool,
    isDisabled: json['is_disabled'] as bool,
    token: json['token'] as String,
    minAmount: (json['min_amount'] as num)?.toDouble(),
    maxAmount: (json['max_amount'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'description': instance.description,
      'user': instance.user,
      'private_money': instance.privateMoney,
      'is_onetime': instance.isOnetime,
      'is_disabled': instance.isDisabled,
      'token': instance.token,
      'min_amount': instance.minAmount,
      'max_amount': instance.maxAmount,
    };
