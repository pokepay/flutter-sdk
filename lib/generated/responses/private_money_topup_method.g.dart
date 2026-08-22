// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_money_topup_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivateMoneyTopupMethod _$PrivateMoneyTopupMethodFromJson(
        Map<String, dynamic> json) =>
    PrivateMoneyTopupMethod(
      type: json['type'] as String,
      name: json['name'] as String,
      amounts: (json['amounts'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      range: (json['range'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$PrivateMoneyTopupMethodToJson(
        PrivateMoneyTopupMethod instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'amounts': instance.amounts,
      'range': instance.range,
    };
