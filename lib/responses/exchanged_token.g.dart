// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchanged_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangedToken _$ExchangedTokenFromJson(Map<String, dynamic> json) =>
    ExchangedToken(
      accessToken: json['access_token'] as String,
      issuedTokenType: json['issued_token_type'] as String,
      tokenType: json['token_type'] as String,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
      scope: json['scope'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$ExchangedTokenToJson(ExchangedToken instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'issued_token_type': instance.issuedTokenType,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'scope': instance.scope,
      'refresh_token': instance.refreshToken,
    };
