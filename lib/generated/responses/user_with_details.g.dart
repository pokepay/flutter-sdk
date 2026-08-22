// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_with_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserWithDetails _$UserWithDetailsFromJson(Map<String, dynamic> json) =>
    UserWithDetails(
      id: json['id'] as String,
      name: json['name'] as String,
      isMerchant: json['is_merchant'] as bool,
      tel: json['tel'] as String?,
      countryCode: json['country_code'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserWithDetailsToJson(UserWithDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_merchant': instance.isMerchant,
      'tel': instance.tel,
      'country_code': instance.countryCode,
      'email': instance.email,
    };
