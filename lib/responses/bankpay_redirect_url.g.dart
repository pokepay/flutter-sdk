// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bankpay_redirect_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankPayRedirectUrl _$BankPayRedirectUrlFromJson(Map<String, dynamic> json) =>
    BankPayRedirectUrl(
      redirectUrl: json['redirect_url'] as String,
      paytreeCustomerNumber: json['paytree_customer_number'] as String?,
    );

Map<String, dynamic> _$BankPayRedirectUrlToJson(BankPayRedirectUrl instance) =>
    <String, dynamic>{
      'redirect_url': instance.redirectUrl,
      'paytree_customer_number': instance.paytreeCustomerNumber,
    };
