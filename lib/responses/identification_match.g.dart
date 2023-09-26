// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identification_match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentificationMatch _$IdentificationMatchFromJson(Map<String, dynamic> json) =>
    IdentificationMatch(
      name: json['name'] as bool,
      gender: json['gender'] as bool,
      address: json['address'] as bool,
      dateOfBirth: json['date_of_birth'] as bool,
    );

Map<String, dynamic> _$IdentificationMatchToJson(
        IdentificationMatch instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'address': instance.address,
      'date_of_birth': instance.dateOfBirth,
    };
