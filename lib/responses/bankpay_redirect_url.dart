import 'package:json_annotation/json_annotation.dart';

part 'bankpay_redirect_url.g.dart';

@JsonSerializable()
class BankPayRedirectUrl {
  // このエンドポイントのレスポンスキーは snake_case ではなく camelCase のため、
  // field_rename: snake を @JsonKey で打ち消す。
  @JsonKey(name: 'redirectUrl')
  final String redirectUrl;
  @JsonKey(name: 'paytreeCustomerNumber')
  final String? paytreeCustomerNumber;

  BankPayRedirectUrl({
    required this.redirectUrl,
    this.paytreeCustomerNumber,
  });

  factory BankPayRedirectUrl.fromJson(Map<String, dynamic> json) =>
      _$BankPayRedirectUrlFromJson(json);

  Map<String, dynamic> toJson() => _$BankPayRedirectUrlToJson(this);

  @override
  String toString() => this.toJson().toString();
}