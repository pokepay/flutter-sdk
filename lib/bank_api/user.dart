import 'package:meta/meta.dart';

import '../pokepay_sdk.dart';
import '../pokepay_flutter_sdk_platform_interface.dart';
import '../responses/no_content.dart';
import '../responses/paginated_accounts.dart';
import '../responses/paginated_transactions.dart';
import '../responses/user.dart';

extension UserAPI on PokepayAPI {
  Future<NoContent> deleteUserEmail({
    required String id,
    required String email,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<NoContent>(
      (j) => NoContent.fromJson(j),
      'deleteUserEmail',
      {
        'env': env.index,
        'accessToken': accessToken,
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
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<PaginatedAccounts>(
      (j) => PaginatedAccounts.fromJson(j),
      'getUserAccounts',
      {
        'env': env.index,
        'accessToken': accessToken,
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
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<PaginatedTransactions>(
      (j) => PaginatedTransactions.fromJson(j),
      'getUserTransactions',
      {
        'env': env.index,
        'accessToken': accessToken,
        'id': id,
        'before': before,
        'after': after,
        'perPage': perPage,
      },
    );
  }

  Future<NoContent> registerUserEmail({
    required String token,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<NoContent>(
      (j) => NoContent.fromJson(j),
      'registerUserEmail',
      {
        'env': env.index,
        'accessToken': accessToken,
        'token': token,
      },
    );
  }

  Future<NoContent> sendConfirmationEmail({
    required String id,
    required String email,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<NoContent>(
      (j) => NoContent.fromJson(j),
      'sendConfirmationEmail',
      {
        'env': env.index,
        'accessToken': accessToken,
        'id': id,
        'email': email,
      },
    );
  }

  Future<User> updateUser({
    required String id,
    String? name,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<User>(
      (j) => User.fromJson(j),
      'updateUser',
      {
        'env': env.index,
        'accessToken': accessToken,
        'id': id,
        'name': name,
      },
    );
  }
}
