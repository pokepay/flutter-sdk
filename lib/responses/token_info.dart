import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../responses.dart';

part 'token_info.g.dart';

enum TokenType {
  CASHTRAY,
  BILL,
  CHECK,
  CPM,
  PAYREGI_TRANSACTION,
  PAYREGI_CANCEL,
  JWT,
  UNKNOWN,
}

@JsonSerializable()
class TokenInfo extends Response {
  @JsonKey(nullable: false)
  final TokenType type;
  @JsonKey(nullable: false)
  final String token;
  Bill bill;
  Check check;

  TokenInfo({
    @required this.type,
    @required this.token,
  });

  factory TokenInfo.fromJson(Map<String, dynamic> json) =>
      _$TokenInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TokenInfoToJson(this);
}

@JsonSerializable()
class TokenInfoMerchant extends TokenInfo {
  final AccountCpmToken cpmToken;
  final Cashtray cashtray;

  TokenInfoMerchant({
    @required TokenType type,
    @required String token,
    this.cpmToken,
    this.cashtray,
  }) : super(type: type, token: token);

  factory TokenInfoMerchant.fromJson(Map<String, dynamic> json) =>
      _$TokenInfoMerchantFromJson(json);
  Map<String, dynamic> toJson() => _$TokenInfoMerchantToJson(this);
}
