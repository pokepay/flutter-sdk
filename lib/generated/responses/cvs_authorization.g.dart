// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cvs_authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CvsAuthorization _$CvsAuthorizationFromJson(Map<String, dynamic> json) =>
    CvsAuthorization(
      id: json['id'] as String,
      serviceOptionType: json['service_option_type'] as String,
      amount: (json['amount'] as num).toInt(),
      name1: json['name1'] as String,
      name2: json['name2'] as String,
      tel: json['tel'] as String,
      payLimit: DateTime.parse(json['pay_limit'] as String),
      account: Account.fromJson(json['account'] as Map<String, dynamic>),
      haraikomiUrl: json['haraikomi_url'] as String,
      receiptNo: json['receipt_no'] as String,
      doneAt: json['done_at'] == null
          ? null
          : DateTime.parse(json['done_at'] as String),
      canceledAt: json['canceled_at'] == null
          ? null
          : DateTime.parse(json['canceled_at'] as String),
    );

Map<String, dynamic> _$CvsAuthorizationToJson(CvsAuthorization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service_option_type': instance.serviceOptionType,
      'amount': instance.amount,
      'name1': instance.name1,
      'name2': instance.name2,
      'tel': instance.tel,
      'pay_limit': instance.payLimit.toIso8601String(),
      'account': instance.account,
      'haraikomi_url': instance.haraikomiUrl,
      'receipt_no': instance.receiptNo,
      'done_at': instance.doneAt?.toIso8601String(),
      'canceled_at': instance.canceledAt?.toIso8601String(),
    };
