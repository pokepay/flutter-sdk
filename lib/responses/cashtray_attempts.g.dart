// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashtray_attempts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashtrayAttempts _$CashtrayAttemptsFromJson(Map<String, dynamic> json) {
  return CashtrayAttempts(
    rows: (json['rows'] as List)
        .map((e) => CashtrayAttempt.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CashtrayAttemptsToJson(CashtrayAttempts instance) =>
    <String, dynamic>{
      'rows': instance.rows,
    };
