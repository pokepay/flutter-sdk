// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_topup_quota.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountTopupQuota _$AccountTopupQuotaFromJson(Map<String, dynamic> json) =>
    AccountTopupQuota(
      id: json['id'] as int,
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String,
      eventName: json['event_name'] as String,
      isSplittable: json['is_splittable'] as bool,
      usedAmount: (json['used_amount'] as num).toDouble(),
      status: json['status'] as String,
      startsAt: json['starts_at'] as String,
      endsAt: json['ends_at'] as String,
      endsAtBuffer: json['ends_at_buffer'] as String,
    );

Map<String, dynamic> _$AccountTopupQuotaToJson(AccountTopupQuota instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'description': instance.description,
      'event_name': instance.eventName,
      'is_splittable': instance.isSplittable,
      'used_amount': instance.usedAmount,
      'status': instance.status,
      'starts_at': instance.startsAt,
      'ends_at': instance.endsAt,
      'ends_at_buffer': instance.endsAtBuffer,
    };
