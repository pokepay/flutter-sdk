import 'package:json_annotation/json_annotation.dart';

part 'o_auth_error.g.dart';

@JsonSerializable()
class OAuthError {
  @JsonKey(nullable: false)
  final String error;

  OAuthError({
    this.error,
  });

  factory OAuthError.fromJson(Map<String, dynamic> json) => _$OAuthErrorFromJson(json);
  Map<String, dynamic> toJson() => _$OAuthErrorToJson(this);
}