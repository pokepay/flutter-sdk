// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      card: json['card'] as String?,
      res300: json['300x300'] as String?,
      res600: json['600x600'] as String?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'card': instance.card,
      '300x300': instance.res300,
      '600x600': instance.res600,
    };
