import 'package:json_annotation/json_annotation.dart';

part 'bankpay_redirect_url.g.dart';

@JsonSerializable()
class BankPayRedirectUrl {
  final String redirectUrl;

  BankPayRedirectUrl({
    required this.redirectUrl,
  });

  factory BankPayRedirectUrl.fromJson(Map<String, dynamic> json) =>
      _$BankPayRedirectUrlFromJson(json);

  Map<String, dynamic> toJson() => _$BankPayRedirectUrlToJson(this);

  @override
  String toString() => this.toJson().toString();
}