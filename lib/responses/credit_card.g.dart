// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCard _$CreditCardFromJson(Map<String, dynamic> json) => CreditCard(
      cardNumber: json['card_number'] as String,
      registeredAt: json['registered_at'] as String,
    );

Map<String, dynamic> _$CreditCardToJson(CreditCard instance) => <String, dynamic>{
      'card_number': instance.cardNumber,
      'registered_at': instance.registeredAt,
    };
