// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jihanpi_vending_machine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JihanpiVendingMachine _$JihanpiVendingMachineFromJson(
        Map<String, dynamic> json) =>
    JihanpiVendingMachine(
      nfcTagId: json['nfc_tag_id'] as String,
      shopId: json['shop_id'] as String,
      shopName: json['shop_name'] as String,
    );

Map<String, dynamic> _$JihanpiVendingMachineToJson(
        JihanpiVendingMachine instance) =>
    <String, dynamic>{
      'nfc_tag_id': instance.nfcTagId,
      'shop_id': instance.shopId,
      'shop_name': instance.shopName,
    };
