// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_pay_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankPaySession _$BankPaySessionFromJson(Map<String, dynamic> json) =>
    BankPaySession(
      redirectUrl: json['redirect_url'] as String,
      paytreeCustomerNumber: json['paytree_customer_number'] as String,
    );

Map<String, dynamic> _$BankPaySessionToJson(BankPaySession instance) =>
    <String, dynamic>{
      'redirect_url': instance.redirectUrl,
      'paytree_customer_number': instance.paytreeCustomerNumber,
    };
