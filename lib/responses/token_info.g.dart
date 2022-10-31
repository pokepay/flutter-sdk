// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenInfo _$TokenInfoFromJson(Map<String, dynamic> json) {
  final tokenType = $enumDecode(_$TokenTypeEnumMap, json['type']);
  late dynamic token;
  switch(tokenType){
    case TokenType.BILL:
      token = Bill.fromJson(json['token'] as Map<String, dynamic>);
      break;
    case TokenType.CASHTRAY:
      token = Cashtray.fromJson(json['token'] as Map<String, dynamic>);
      break;
    case TokenType.CHECK:
      token = Check.fromJson(json['token'] as Map<String, dynamic>);
      break;
    case TokenType.CPM:
      token = AccountCpmToken.fromJson(json['token'] as Map<String, dynamic>);
      break;
    case TokenType.PAYREGI:
    case TokenType.JWT:
      token = json['token'];
      break;
    case TokenType.UNKNOWN:
      token = '';
      break;
  }
  return TokenInfo(
    type: tokenType,
    token: token,
  );
}

Map<String, dynamic> _$TokenInfoToJson(TokenInfo instance){
  late dynamic token;
  switch(instance.type){

    case TokenType.CASHTRAY:
      token = (instance.token as Cashtray).toJson();
      break;
    case TokenType.BILL:
      token = (instance.token as Bill).toJson();
      break;
    case TokenType.CHECK:
      token = (instance.token as Check).toJson();
      break;
    case TokenType.CPM:
      token = (instance.token as AccountCpmToken).toJson();
      break;
    case TokenType.PAYREGI:
    case TokenType.JWT:
    case TokenType.UNKNOWN:
      token = instance.token;
      break;
  }
  return <String, dynamic>{
    'type': _$TokenTypeEnumMap[instance.type]!,
    'token': token,
  };
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
