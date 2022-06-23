// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'o_auth_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuthError _$OAuthErrorFromJson(Map<String, dynamic> json) {
  return OAuthError(
    error: json['error'] as String,
  );
}

Map<String, dynamic> _$OAuthErrorToJson(OAuthError instance) => <String, dynamic>{
      'error': instance.error,
    };
