// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenInfo _$TokenInfoFromJson(Map<String, dynamic> json) {
  return TokenInfo(
    type: _$enumDecode(_$TokenTypeEnumMap, json['type']),
    token: json['token'] as dynamic,
    bill: json['bill'] == null ? null : Bill.fromJson(json['bill'] as Map<String, dynamic>),
    check: json['check'] == null ? null : Check.fromJson(json['check'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TokenInfoToJson(TokenInfo instance) => <String, dynamic>{
      'type': _$TokenTypeEnumMap[instance.type],
      'token': instance.token,
      'bill': instance.bill,
      'check': instance.check,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries.singleWhere((e) => e.value == source).key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue!;
}

const _$TokenTypeEnumMap = {
  TokenType.CASHTRAY: 'CASHTRAY',
  TokenType.BILL: 'BILL',
  TokenType.CHECK: 'CHECK',
  TokenType.CPM: 'CPM',
  TokenType.PAYREGI: 'PAYREGI',
  TokenType.JWT: 'JWT',
  TokenType.UNKNOWN: 'UNKNOWN',
};

TokenInfoMerchant _$TokenInfoMerchantFromJson(Map<String, dynamic> json) {
  return TokenInfoMerchant(
    type: _$enumDecode(_$TokenTypeEnumMap, json['type']),
    token: json['token'] as String,
    cpmToken: json['cpm_token'] == null ? null : AccountCpmToken.fromJson(json['cpm_token'] as Map<String, dynamic>),
    cashtray: json['cashtray'] == null ? null : Cashtray.fromJson(json['cashtray'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TokenInfoMerchantToJson(TokenInfoMerchant instance) => <String, dynamic>{
      'type': _$TokenTypeEnumMap[instance.type],
      'token': instance.token,
      'bill': instance.bill,
      'check': instance.check,
      'cpm_token': instance.cpmToken,
      'cashtray': instance.cashtray,
    };
