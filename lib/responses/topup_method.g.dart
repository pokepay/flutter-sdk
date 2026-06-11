// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopupMethod _$TopupMethodFromJson(Map<String, dynamic> json) => TopupMethod(
      type: json['type'] as String,
      name: json['name'] as String,
      amounts: (json['amounts'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      range: (json['range'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$TopupMethodToJson(TopupMethod instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'amounts': instance.amounts,
      'range': instance.range,
    };
