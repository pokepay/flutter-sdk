import 'package:json_annotation/json_annotation.dart';

part 'exchanged_token.g.dart';

@JsonSerializable()
class ExchangedToken {
  final String accessToken;
  final String issuedTokenType;
  final String tokenType;
  final int? expiresIn;
  final String? scope;
  final String? refreshToken;

  ExchangedToken({
    required this.accessToken,
    required this.issuedTokenType,
    required this.tokenType,
    this.expiresIn,
    this.scope,
    this.refreshToken,
  });

  factory ExchangedToken.fromJson(Map<String, dynamic> json) => _$ExchangedTokenFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangedTokenToJson(this);

  @override
  String toString() => this.toJson().toString();
}
