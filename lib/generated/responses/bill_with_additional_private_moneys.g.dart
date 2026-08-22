// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_with_additional_private_moneys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillWithAdditionalPrivateMoneys _$BillWithAdditionalPrivateMoneysFromJson(
        Map<String, dynamic> json) =>
    BillWithAdditionalPrivateMoneys(
      id: json['id'] as String,
      amount: (json['amount'] as num?)?.toDouble(),
      description: json['description'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      isOnetime: json['is_onetime'] as bool,
      isDisabled: json['is_disabled'] as bool,
      privateMoney:
          PrivateMoney.fromJson(json['private_money'] as Map<String, dynamic>),
      token: json['token'] as String,
      maxAmount: (json['max_amount'] as num?)?.toDouble(),
      minAmount: (json['min_amount'] as num?)?.toDouble(),
      additionalPrivateMoneys:
          (json['additional_private_moneys'] as List<dynamic>)
              .map((e) => PrivateMoney.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$BillWithAdditionalPrivateMoneysToJson(
        BillWithAdditionalPrivateMoneys instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'description': instance.description,
      'user': instance.user,
      'is_onetime': instance.isOnetime,
      'is_disabled': instance.isDisabled,
      'private_money': instance.privateMoney,
      'token': instance.token,
      'max_amount': instance.maxAmount,
      'min_amount': instance.minAmount,
      'additional_private_moneys': instance.additionalPrivateMoneys,
    };
