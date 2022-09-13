// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenInfo _$TokenInfoFromJson(Map<String, dynamic> json) => TokenInfo(
      type: $enumDecode(_$TokenTypeEnumMap, json['type']),
      token: json['token'],
      bill: json['bill'] == null
          ? null
          : Bill.fromJson(json['bill'] as Map<String, dynamic>),
      check: json['check'] == null
          ? null
          : Check.fromJson(json['check'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenInfoToJson(TokenInfo instance) => <String, dynamic>{
      'type': _$TokenTypeEnumMap[instance.type]!,
      'token': instance.token,
      'bill': instance.bill?.toJson(),
      'check': instance.check?.toJson(),
    };

const _$TokenTypeEnumMap = {
  TokenType.CASHTRAY: 'CASHTRAY',
  TokenType.BILL: 'BILL',
  TokenType.CHECK: 'CHECK',
  TokenType.CPM: 'CPM',
  TokenType.PAYREGI: 'PAYREGI',
  TokenType.JWT: 'JWT',
  TokenType.UNKNOWN: 'UNKNOWN',
};

TokenInfoMerchant _$TokenInfoMerchantFromJson(Map<String, dynamic> json) =>
    TokenInfoMerchant(
      type: $enumDecode(_$TokenTypeEnumMap, json['type']),
      token: json['token'] as String,
      cpmToken: json['cpm_token'] == null
          ? null
          : AccountCpmToken.fromJson(json['cpm_token'] as Map<String, dynamic>),
      cashtray: json['cashtray'] == null
          ? null
          : Cashtray.fromJson(json['cashtray'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenInfoMerchantToJson(TokenInfoMerchant instance) =>
    <String, dynamic>{
      'type': _$TokenTypeEnumMap[instance.type]!,
      'token': instance.token,
      'cpm_token': instance.cpmToken?.toJson(),
      'cashtray': instance.cashtray?.toJson(),
    };
