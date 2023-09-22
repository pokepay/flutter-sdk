// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identification_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentificationResult _$IdentificationResultFromJson(
        Map<String, dynamic> json) =>
    IdentificationResult(
      isValid: json['is_valid'] as bool,
      identifiedAt: json['identified_at'] as String?,
      match:
          IdentificationMatch.fromJson(json['match'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IdentificationResultToJson(
        IdentificationResult instance) =>
    <String, dynamic>{
      'is_valid': instance.isValid,
      'identified_at': instance.identifiedAt,
      'match': instance.match,
    };
