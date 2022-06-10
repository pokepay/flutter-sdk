
import 'package:meta/meta.dart';

import '../responses.dart';

part 'token_info.g.dart';

enum TokenType {
  CASHTRAY,
  BILL,
  CHECK,
  CPM,
  PAYREGI,
  PAYREGI_TRANSACTION,
  PAYREGI_CANCEL,
  JWT,
  UNKNOWN,
}


class TokenInfo extends Response {
  final TokenType type;
  final dynamic token;
  Bill? bill;
  Check? check;
  AccountCpmToken? cpmToken;

  TokenInfo({
    required this.type,
    required this.token,
    this.bill,
    this.check,
    this.cpmToken
  });

  factory TokenInfo.fromJson(Map<String, dynamic> json) =>
      _$TokenInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TokenInfoToJson(this);
}


class TokenInfoMerchant extends TokenInfo {
  final AccountCpmToken? cpmToken;
  final Cashtray? cashtray;

  TokenInfoMerchant({
    required TokenType type,
    required String token,
    this.cpmToken,
    this.cashtray,
  }) : super(type: type, token: token);

  factory TokenInfoMerchant.fromJson(Map<String, dynamic> json) =>
      _$TokenInfoMerchantFromJson(json);
  Map<String, dynamic> toJson() => _$TokenInfoMerchantToJson(this);
}
