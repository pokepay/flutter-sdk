import 'package:meta/meta.dart';

import '../pokepay_sdk.dart';
import '../responses.dart';

enum CpmTokenScope {
  none, // = 0
  payemnt,
  topup,
  both,
}

extension AccountAPI on PokepayAPI {
  Future<Account> createAccount({
    String name,
    String privateMoneyId,
  }) async {
    return await invokeMethod<Account>(
      (j) => Account.fromJson(j),
      'createAccount',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'name': name,
        'privateMoneyId': privateMoneyId,
      },
    );
  }

  Future<AccountCpmToken> createAccountCpmToken({
    @required String accountId,
    @required CpmTokenScope scopes,
    int expiresIn,
    String additionalInfo,
  }) async {
    return await invokeMethod<AccountCpmToken>(
      (j) => AccountCpmToken.fromJson(j),
      'createAccountCpmToken',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'accountId': accountId,
        'scopes': scopes.index,
        'expiresIn': expiresIn,
        'additionalInfo': additionalInfo,
      },
    );
  }

  Future<Account> getAccount({
    @required String id,
  }) async {
    return await invokeMethod<Account>(
      (j) => Account.fromJson(j),
      'getAccount',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
      },
    );
  }

  Future<PaginatedAccountBalances> getAccountBalances({
    @required String id,
    String before,
    String after,
    int perPage,
  }) async {
    return await invokeMethod<PaginatedAccountBalances>(
      (j) => PaginatedAccountBalances.fromJson(j),
      'getAccountBalances',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
        'before': before,
        'after': after,
        'perPage': perPage,
      },
    );
  }

  Future<PaginatedTransactions> getAccounTransactions({
    @required String id,
    String before,
    String after,
    int perPage,
  }) async {
    return await invokeMethod<PaginatedTransactions>(
      (j) => PaginatedTransactions.fromJson(j),
      'getAccountTransactions',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
        'before': before,
        'after': after,
        'perPage': perPage,
      },
    );
  }
}
