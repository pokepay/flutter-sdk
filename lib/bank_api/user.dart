import '../responses/bankpay.dart';
import '../responses/user_transaction.dart';
import '../responses/bankpay_redirect_url.dart';
import '../pokepay_sdk.dart';
import '../responses/no_content.dart';
import '../responses/paginated_accounts.dart';
import '../responses/paginated_transactions.dart';
import '../responses/user.dart';
import '../responses/user_with_auth_factors.dart';

extension UserAPI on PokepayAPI {
  Future<NoContent> deleteUserEmail({
    required String id,
    required String email,
  }) async {
    return await invokeMethod<NoContent>(
      (j) => NoContent.fromJson(j),
      'deleteUserEmail',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
        'email': email,
      },
    );
  }

  Future<PaginatedAccounts> getUserAccounts({
    required String id,
    String? before,
    String? after,
    int? perPage,
  }) async {
    return await invokeMethod<PaginatedAccounts>(
      (j) => PaginatedAccounts.fromJson(j),
      'getUserAccounts',
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

  Future<PaginatedTransactions> getUserTransactions({
    required String id,
    String? before,
    String? after,
    int? perPage,
  }) async {
    return await invokeMethod<PaginatedTransactions>(
      (j) => PaginatedTransactions.fromJson(j),
      'getUserTransactions',
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

  Future<UserWithAuthFactors> getUserWithAuthFactors({
    required String userId,
  }) async {
    return await invokeMethod<UserWithAuthFactors>(
      (j) => UserWithAuthFactors.fromJson(j),
      'getUserWithAuthFactors',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'userId': userId,
      },
    );
  }

  Future<NoContent> registerUserEmail({
    required String token,
  }) async {
    return await invokeMethod<NoContent>(
      (j) => NoContent.fromJson(j),
      'registerUserEmail',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'token': token,
      },
    );
  }

  Future<NoContent> sendConfirmationEmail({
    required String id,
    required String email,
  }) async {
    return await invokeMethod<NoContent>(
      (j) => NoContent.fromJson(j),
      'sendConfirmationEmail',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
        'email': email,
      },
    );
  }

  Future<User> updateUser({
    required String id,
    String? name,
  }) async {
    return await invokeMethod<User>(
      (j) => User.fromJson(j),
      'updateUser',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
        'name': name,
      },
    );
  }

  Future<BankPayRedirectUrl> createBankPay({
    required String id,
    required String callbackUrl,
    required String privateMoneyId,
    String? kana,
  }) async {
    return await invokeMethod<BankPayRedirectUrl>(
      (j) => BankPayRedirectUrl.fromJson(j),
      'createBankPay',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
        'callbackUrl': callbackUrl,
        'privateMoneyId': privateMoneyId,
        'kana': kana,
      },
    );
  }

  Future<List<BankPay>> getBankPay({
    required String id,
    String? privateMoneyId,
  }) async {
    return await invokeMethod<List<BankPay>>(
      (j) {
        return (j as List<dynamic>).map((k) => BankPay.fromJson(k)).toList();
      },
      'getBankPay',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
        'privateMoneyId': privateMoneyId,
      },
    );
  }

  Future<UserTransaction> bankpayTopUp({
    required String id,
    required String accountId,
    required String bankId,
    required String amount,
    String? requestId,
  }) async {
    return await invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'bankpayTopUp',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
        'accountId': accountId,
        'bankId': bankId,
        'amount': amount,
        'requestId': requestId,
      },
    );
  }

  Future<NoContent> deleteBankPay({
    required String id,
    required String bankId,
  }) async {
    return await invokeMethod<NoContent>(
      (j) => NoContent.fromJson(j),
      'deleteBankPay',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
        'bankId': bankId,
      },
    );
  }
}
