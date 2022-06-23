import 'package:json_annotation/json_annotation.dart';

import '../responses.dart';

part 'token_info.g.dart';

enum TokenType {
  CASHTRAY,
  BILL,
  CHECK,
  CPM,
  PAYREGI,
  JWT,
  UNKNOWN,
}

@JsonSerializable()
class TokenInfo extends Response {
  final TokenType type;
  final dynamic token;
  final Bill? bill;
  final Check? check;

  TokenInfo({
    required this.type,
    required this.token,
    this.bill,
    this.check,
  });

  factory TokenInfo.fromJson(Map<String, dynamic> json) => _$TokenInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenInfoToJson(this);
}

@JsonSerializable()
class TokenInfoMerchant extends TokenInfo {
  final AccountCpmToken? cpmToken;
  final Cashtray? cashtray;

  TokenInfoMerchant({
    required TokenType type,
    required String token,
    this.cpmToken,
    this.cashtray,
  }) : super(type: type, token: token);

  factory TokenInfoMerchant.fromJson(Map<String, dynamic> json) => _$TokenInfoMerchantFromJson(json);

  Map<String, dynamic> toJson() => _$TokenInfoMerchantToJson(this);
}
