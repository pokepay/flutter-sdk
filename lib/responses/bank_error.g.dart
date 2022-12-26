// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankError _$BankErrorFromJson(Map<String, dynamic> json) => BankError(
      type: json['type'] as String,
      message: json['message'] as String,
      errors: json['errors'],
    );

Map<String, dynamic> _$BankErrorToJson(BankError instance) => <String, dynamic>{
      'type': instance.type,
      'message': instance.message,
      'errors': instance.errors,
    };
