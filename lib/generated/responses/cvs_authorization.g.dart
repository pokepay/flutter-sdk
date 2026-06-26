// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cvs_authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CvsAuthorization _$CvsAuthorizationFromJson(Map<String, dynamic> json) =>
    CvsAuthorization(
      id: json['id'] as String,
      serviceOptionType: json['service_option_type'] as String,
      amount: json['amount'] as int,
      name1: json['name1'] as String,
      name2: json['name2'] as String,
      tel: json['tel'] as String,
      payLimit: json['pay_limit'] as String,
      account: Account.fromJson(json['account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CvsAuthorizationToJson(CvsAuthorization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service_option_type': instance.serviceOptionType,
      'amount': instance.amount,
      'name1': instance.name1,
      'name2': instance.name2,
      'tel': instance.tel,
      'pay_limit': instance.payLimit,
      'account': instance.account,
    };
