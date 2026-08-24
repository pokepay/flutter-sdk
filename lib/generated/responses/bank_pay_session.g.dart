// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_pay_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankPaySession _$BankPaySessionFromJson(Map<String, dynamic> json) =>
    BankPaySession(
      redirectUrl: json['redirectUrl'] as String,
      paytreeCustomerNumber: json['paytreeCustomerNumber'] as String,
    );

Map<String, dynamic> _$BankPaySessionToJson(BankPaySession instance) =>
    <String, dynamic>{
      'redirectUrl': instance.redirectUrl,
      'paytreeCustomerNumber': instance.paytreeCustomerNumber,
    };
