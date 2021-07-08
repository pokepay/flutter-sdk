import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../custom_datetime_converter.dart';
import '../responses.dart';

part 'account_cpm_token.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class AccountCpmToken extends Response {
  @JsonKey(nullable: false)
  final String cpmToken;
  @JsonKey(nullable: false)
  final Account account;
  final UserTransaction transaction;
  @JsonKey(nullable: false)
  final List<String> scopes;
  @JsonKey(nullable: false)
  final DateTime expiresAt;
  final String additionalInfo;

  AccountCpmToken({
    @required this.cpmToken,
    @required this.account,
    this.transaction,
    @required this.scopes,
    @required this.expiresAt,
    this.additionalInfo,
  });

  factory AccountCpmToken.fromJson(Map<String, dynamic> json) =>
      _$AccountCpmTokenFromJson(json);
  Map<String, dynamic> toJson() => _$AccountCpmTokenToJson(this);
}
