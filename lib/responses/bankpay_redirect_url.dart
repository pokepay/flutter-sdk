import 'package:json_annotation/json_annotation.dart';

part 'bankpay_redirect_url.g.dart';

@JsonSerializable()
class BankPayRedirectUrl {
  final String redirectUrl;
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