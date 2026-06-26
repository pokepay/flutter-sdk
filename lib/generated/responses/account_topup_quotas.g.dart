// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_topup_quotas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountTopupQuotas _$AccountTopupQuotasFromJson(Map<String, dynamic> json) =>
    AccountTopupQuotas(
      rows: (json['rows'] as List<dynamic>)
          .map((e) => AccountTopupQuota.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountTopupQuotasToJson(AccountTopupQuotas instance) =>
    <String, dynamic>{
      'rows': instance.rows,
    };
