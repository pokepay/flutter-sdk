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

// fromJson / toJson は type に応じた手書き実装 (下記) を使うため生成しない
@JsonSerializable(createFactory: false, createToJson: false)
class TokenInfo extends Response {
  final TokenType type;
  final dynamic token;

  TokenInfo({
    required this.type,
    required this.token,
  });

  // token は type に応じて Bill / Cashtray / Check / AccountCpmToken に
  // 型付けして復元する。以前はこのロジックが生成ファイル (token_info.g.dart) に
  // 直接手書きされていたが、再生成で消えないようこちらに置く。
  factory TokenInfo.fromJson(Map<String, dynamic> json) {
    final tokenType = $enumDecode(_$TokenTypeEnumMap, json['type']);
    late dynamic token;
    switch (tokenType) {
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

  Map<String, dynamic> toJson() {
    late dynamic token;
    switch (this.type) {
      case TokenType.CASHTRAY:
        token = (this.token as Cashtray).toJson();
        break;
      case TokenType.BILL:
        token = (this.token as Bill).toJson();
        break;
      case TokenType.CHECK:
        token = (this.token as Check).toJson();
        break;
      case TokenType.CPM:
        token = (this.token as AccountCpmToken).toJson();
        break;
      case TokenType.PAYREGI:
      case TokenType.JWT:
      case TokenType.UNKNOWN:
        token = this.token;
        break;
    }
    return <String, dynamic>{
      'type': _$TokenTypeEnumMap[this.type]!,
      'token': token,
    };
  }
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

  @override
  String toString() => this.toJson().toString();
}
