import 'dart:convert';

export 'responses/access_token.dart';
export 'responses/account.dart';
export 'responses/account_balance.dart';
export 'responses/account_cpm_token.dart';
export 'responses/bill.dart';
export 'responses/cashtray.dart';
export 'responses/cashtray_attempt.dart';
export 'responses/cashtray_attempts.dart';
export 'responses/check.dart';
export 'responses/error.dart';
export 'responses/images.dart';
export 'responses/jwt_result.dart';
export 'responses/message.dart';
export 'responses/message_attachment.dart';
export 'responses/message_unread_count.dart';
export 'responses/no_content.dart';
export 'responses/organization.dart';
export 'responses/paginated_account_balances.dart';
export 'responses/paginated_account_balances.dart';
export 'responses/paginated_accounts.dart';
export 'responses/paginated_messages.dart';
export 'responses/paginated_private_moneys.dart';
export 'responses/paginated_transactions.dart';
export 'responses/private_money.dart';
export 'responses/server_key.dart';
export 'responses/terminal.dart';
export 'responses/token_info.dart';
export 'responses/user.dart';
export 'responses/user_transaction.dart';

class Response {
  static const String indent = '  ';
  Map<String, dynamic> toJson() => {};
  String toString() {
    JsonEncoder encoder = new JsonEncoder.withIndent(Response.indent);
    return encoder.convert(this.toJson());
  }
}
