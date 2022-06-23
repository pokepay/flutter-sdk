import 'package:json_annotation/json_annotation.dart';

part 'access_token.g.dart';

@JsonSerializable()
class AccessToken {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int? expiresIn;

  AccessToken({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    this.expiresIn,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) => _$AccessTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}
