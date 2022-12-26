// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      type: json['type'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'type': instance.type,
      'message': instance.message,
    };

OAuthError _$OAuthErrorFromJson(Map<String, dynamic> json) => OAuthError(
      error: json['error'] as String,
    );

Map<String, dynamic> _$OAuthErrorToJson(OAuthError instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

APIRequestError _$APIRequestErrorFromJson(Map<String, dynamic> json) =>
    APIRequestError(
      statusCode: json['status_code'] as int,
      error: Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$APIRequestErrorToJson(APIRequestError instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'error': instance.error.toJson(),
    };

ProcessingError _$ProcessingErrorFromJson(Map<String, dynamic> json) =>
    ProcessingError(
      message: json['message'] as String,
    );

Map<String, dynamic> _$ProcessingErrorToJson(ProcessingError instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

OAuthRequestError _$OAuthRequestErrorFromJson(Map<String, dynamic> json) =>
    OAuthRequestError(
      statusCode: json['status_code'] as int,
      error: OAuthError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OAuthRequestErrorToJson(OAuthRequestError instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'error': instance.error.toJson(),
    };
