import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_sdk/responses/account_topup_quota.dart';

part 'account_topup_quotas.g.dart';

@JsonSerializable()
class AccountTopupQuotas {
  final List<AccountTopupQuota> rows;

  AccountTopupQuotas({
    required this.rows,
  });

  factory AccountTopupQuotas.fromJson(Map<String, dynamic> json) =>
      _$AccountTopupQuotasFromJson(json);

  Map<String, dynamic> toJson() => _$AccountTopupQuotasToJson(this);

  @override
  String toString() => this.toJson().toString();
}
