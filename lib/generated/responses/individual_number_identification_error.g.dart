// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_number_identification_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndividualNumberIdentificationError
    _$IndividualNumberIdentificationErrorFromJson(Map<String, dynamic> json) =>
        IndividualNumberIdentificationError(
          type: json['type'] as String,
          message: json['message'] as String,
          errorCode: (json['error_code'] as num).toInt(),
          errorMessage: json['error_message'] as String,
        );

Map<String, dynamic> _$IndividualNumberIdentificationErrorToJson(
        IndividualNumberIdentificationError instance) =>
    <String, dynamic>{
      'type': instance.type,
      'message': instance.message,
      'error_code': instance.errorCode,
      'error_message': instance.errorMessage,
    };
