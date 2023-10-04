// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_campaign_point_amounts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountCampaignPointAmounts _$AccountCampaignPointAmountsFromJson(Map<String, dynamic> json) =>
    AccountCampaignPointAmounts(
      maxTotalPointAmount: (json['max_total_point_amount'] as num?)?.toDouble(),
      totalPointAmount: (json['total_point_amount'] as num?)?.toDouble(),
      remainPointAmount: (json['remain_point_amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AccountCampaignPointAmountsToJson(AccountCampaignPointAmounts instance) =>
    <String, dynamic>{
      'max_total_point_amount': instance.maxTotalPointAmount,
      'total_point_amount': instance.totalPointAmount,
      'remain_point_amount': instance.remainPointAmount,
    };
