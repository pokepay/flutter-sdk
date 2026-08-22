// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_with_auth_factors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserWithAuthFactors _$UserWithAuthFactorsFromJson(Map<String, dynamic> json) =>
    UserWithAuthFactors(
      id: json['id'] as String,
      name: json['name'] as String,
      isMerchant: json['is_merchant'] as bool,
      tel: json['tel'] as String?,
      countryCode: json['country_code'] as String?,
      email: json['email'] as String?,
      isPasswordRegistered: json['is_password_registered'] as bool,
    );

Map<String, dynamic> _$UserWithAuthFactorsToJson(
        UserWithAuthFactors instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_merchant': instance.isMerchant,
      'tel': instance.tel,
      'country_code': instance.countryCode,
      'email': instance.email,
      'is_password_registered': instance.isPasswordRegistered,
    };
