import 'package:json_annotation/json_annotation.dart';

part 'account_campaign_point_amounts.g.dart';

@JsonSerializable()
class AccountCampaignPointAmounts {
  final double? maxTotalPointAmount;
  final double? totalPointAmount;
  final double? remainPointAmount;

  AccountCampaignPointAmounts({
    this.maxTotalPointAmount,
    this.totalPointAmount,
    this.remainPointAmount,
  });

  factory AccountCampaignPointAmounts.fromJson(Map<String, dynamic> json) =>
      _$AccountCampaignPointAmountsFromJson(json);

  Map<String, dynamic> toJson() => _$AccountCampaignPointAmountsToJson(this);

  @override
  String toString() => this.toJson().toString();
}