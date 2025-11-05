// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_topup_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountTopupStats _$AccountTopupStatsFromJson(Map<String, dynamic> json) =>
    AccountTopupStats(
      currentAmount: (json['current_amount'] as num).toDouble(),
      limitAmount: (json['limit_amount'] as num).toDouble(),
      remainingAmount: (json['remaining_amount'] as num).toDouble(),
      startedAt: json['started_at'] as String?,
    );

Map<String, dynamic> _$AccountTopupStatsToJson(AccountTopupStats instance) =>
    <String, dynamic>{
      'current_amount': instance.currentAmount,
      'limit_amount': instance.limitAmount,
      'remaining_amount': instance.remainingAmount,
      'started_at': instance.startedAt,
    };
