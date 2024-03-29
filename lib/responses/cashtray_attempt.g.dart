// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashtray_attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashtrayAttempt _$CashtrayAttemptFromJson(Map<String, dynamic> json) => CashtrayAttempt(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      account: json['account'] == null ? null : Account.fromJson(json['account'] as Map<String, dynamic>),
      statusCode: json['status_code'] as int,
      errorType: json['error_type'] as String,
      errorMessage: json['error_message'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      strategy: json['strategy'] as String,
    );

Map<String, dynamic> _$CashtrayAttemptToJson(CashtrayAttempt instance) => <String, dynamic>{
      'user': instance.user.toJson(),
      'account': instance.account?.toJson(),
      'status_code': instance.statusCode,
      'error_type': instance.errorType,
      'error_message': instance.errorMessage,
      'created_at': instance.createdAt.toIso8601String(),
      'strategy': instance.strategy,
    };
