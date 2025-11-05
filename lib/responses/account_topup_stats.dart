import 'package:json_annotation/json_annotation.dart';

part 'account_topup_stats.g.dart';

@JsonSerializable()
class AccountTopupStats {
  final double currentAmount;
  final double limitAmount;
  final double remainingAmount;
  final String? startedAt;

  AccountTopupStats({
    required this.currentAmount,
    required this.limitAmount,
    required this.remainingAmount,
    this.startedAt,
  });

  factory AccountTopupStats.fromJson(Map<String, dynamic> json) =>
      _$AccountTopupStatsFromJson(json);

  Map<String, dynamic> toJson() => _$AccountTopupStatsToJson(this);

  @override
  String toString() => this.toJson().toString();
}
