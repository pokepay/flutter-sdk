// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_number_identification_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndividualNumberIdentificationStatus
    _$IndividualNumberIdentificationStatusFromJson(Map<String, dynamic> json) =>
        IndividualNumberIdentificationStatus(
          isValid: json['is_valid'] as bool,
          lastIdentifiedAt: json['last_identified_at'] == null
              ? null
              : DateTime.parse(json['last_identified_at'] as String),
          expiresAt: json['expires_at'] == null
              ? null
              : DateTime.parse(json['expires_at'] as String),
          isResident: json['is_resident'] as bool,
        );

Map<String, dynamic> _$IndividualNumberIdentificationStatusToJson(
        IndividualNumberIdentificationStatus instance) =>
    <String, dynamic>{
      'is_valid': instance.isValid,
      'last_identified_at': instance.lastIdentifiedAt?.toIso8601String(),
      'expires_at': instance.expiresAt?.toIso8601String(),
      'is_resident': instance.isResident,
    };
