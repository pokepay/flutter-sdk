

part 'o_auth_error.g.dart';


class OAuthError {

  final String error;

  OAuthError({
    required this.error,
  });

  factory OAuthError.fromJson(Map<String, dynamic> json) => _$OAuthErrorFromJson(json);
  Map<String, dynamic> toJson() => _$OAuthErrorToJson(this);
}