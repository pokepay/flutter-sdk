import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_flutter_sdk/responses/user_transaction.dart';

import '../custom_datetime_converter.dart';
import 'account.dart';

part 'account_cpm_token.g.dart';

@JsonSerializable()
class AccountCpmToken {
  final String cpmToken;
  final Account account;
  final UserTransaction? transaction;
  final List<String> scopes;
  final DateTime? expiresAt;
  final Map<String, String>? metadata;

  AccountCpmToken({
    required this.cpmToken,
    required this.account,
    this.transaction,
    required this.scopes,
    this.expiresAt,
    this.metadata,
  });

  factory AccountCpmToken.fromJson(Map<String, dynamic> json) => _$AccountCpmTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AccountCpmTokenToJson(this);
}
