import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../responses.dart';

part 'access_token.g.dart';

@JsonSerializable()
class AccessToken extends Response {
  @JsonKey(nullable: false)
  final String accessToken;
  @JsonKey(nullable: false)
  final String refreshToken;
  @JsonKey(nullable: false)
  final String tokenType;
  @JsonKey(nullable: false)
  final int expiresIn;

  AccessToken({
    @required this.accessToken,
    @required this.refreshToken,
    @required this.tokenType,
    @required this.expiresIn,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);
  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}
