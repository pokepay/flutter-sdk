// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_shop_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailedShopInformation _$DetailedShopInformationFromJson(
        Map<String, dynamic> json) =>
    DetailedShopInformation(
      id: json['id'] as String,
      name: json['name'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => UserTagInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      businessHours: json['business_hours'] as String,
      regularClosedDays: json['regular_closed_days'] as String,
      url: json['url'] as String?,
      logoImageUrl: json['logo_image_url'] as String?,
      imageUrls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      address: json['address'] as String?,
      tel: json['tel'] as String?,
    );

Map<String, dynamic> _$DetailedShopInformationToJson(
        DetailedShopInformation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tags': instance.tags,
      'business_hours': instance.businessHours,
      'regular_closed_days': instance.regularClosedDays,
      'url': instance.url,
      'logo_image_url': instance.logoImageUrl,
      'image_urls': instance.imageUrls,
      'address': instance.address,
      'tel': instance.tel,
    };
