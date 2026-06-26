// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopInformation _$ShopInformationFromJson(Map<String, dynamic> json) =>
    ShopInformation(
      id: json['id'] as String,
      name: json['name'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => UserTagInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      logoImageUrl: json['logo_image_url'] as String?,
    );

Map<String, dynamic> _$ShopInformationToJson(ShopInformation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tags': instance.tags,
      'logo_image_url': instance.logoImageUrl,
    };
