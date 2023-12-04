// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bankpay_redirect_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankPayRedirectUrl _$BankPayRedirectUrlFromJson(Map<String, dynamic> json) =>
    BankPayRedirectUrl(
      redirectUrl: json['redirectUrl'] as String,
      paytreeCustomerNumber: json['paytreeCustomerNumber'] as String?,
    );

Map<String, dynamic> _$BankPayRedirectUrlToJson(BankPayRedirectUrl instance) =>
    <String, dynamic>{
      'redirectUrl': instance.redirectUrl,
      'paytreeCustomerNumber': instance.paytreeCustomerNumber,
    };
