
import 'package:meta/meta.dart';

import '../custom_datetime_converter.dart';
import '../responses.dart';

part 'account_cpm_token.g.dart';


@CustomDateTimeConverter()
class AccountCpmToken extends Response {
  
  final String cpmToken;
  
  final Account account;
  final UserTransaction? transaction;
  
  final List<String> scopes;
  
  final DateTime? expiresAt;
  final Map<String, dynamic>? metadata;


  AccountCpmToken({
    required this.cpmToken,
    required this.account,
    this.transaction,
    required this.scopes,
    required this.expiresAt,
    this.metadata
  });

  factory AccountCpmToken.fromJson(Map<String, dynamic> json) =>
      _$AccountCpmTokenFromJson(json);
  Map<String, dynamic> toJson() => _$AccountCpmTokenToJson(this);
}
