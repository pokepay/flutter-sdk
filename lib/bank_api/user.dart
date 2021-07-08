import 'package:meta/meta.dart';

import '../pokepay_sdk.dart';
import '../responses/no_content.dart';
import '../responses/paginated_accounts.dart';
import '../responses/paginated_transactions.dart';
import '../responses/user.dart';

extension UserAPI on PokepayAPI {
  Future<NoContent> deleteUserEmail({
    @required String id,
    @required String email,
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
    @required String id,
    String before,
    String after,
    int perPage,
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
    @required String id,
    String before,
    String after,
    int perPage,
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

  Future<NoContent> registerUserEmail({
    @required String token,
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
    @required String id,
    @required String email,
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
    @required String id,
    String name,
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
}
