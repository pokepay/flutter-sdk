// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCard _$CreditCardFromJson(Map<String, dynamic> json) => CreditCard(
      id: json['id'] as String,
      cardNumber: json['card_number'] as String,
      registeredAt: json['registered_at'] as String,
    );

Map<String, dynamic> _$CreditCardToJson(CreditCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'card_number': instance.cardNumber,
      'registered_at': instance.registeredAt,
    };
