import 'package:pokepay_sdk/pokepay_sdk.dart';
import 'package:pokepay_sdk/responses.dart';

extension CVSAPI on PokepayAPI {
  Future<CvsAuthorization> createCvsAuthorization({
    required String serviceOptionType,
    required int amount,
    required String name1,
    required String name2,
    required String tel,
    int? topupQuotaId,
    required String accountId,
  }) async {
    return await invokeMethod<CvsAuthorization>(
      (j) => CvsAuthorization.fromJson(j),
      'createCvsAuthorization',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'serviceOptionType': serviceOptionType,
        'amount': amount,
        'name1': name1,
        'name2': name2,
        'tel': tel,
        'topupQuotaId': topupQuotaId,
        'accountId': accountId,
      },
    );
  }

  Future<CvsAuthorization> getCvsAuthorization({
    required String accountId,
    required String orderId,
  }) async {
    return await invokeMethod<CvsAuthorization>(
      (j) => CvsAuthorization.fromJson(j),
      'getCvsAuthorization',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'accountId': accountId,
        'orderId': orderId,
      },
    );
  }

  Future<PaginatedCvsAuthorizations> getCvsAuthorizations({
    required String accountId,
    String? before,
    String? after,
    int? perPage,
  }) async {
    return await invokeMethod<PaginatedCvsAuthorizations>(
      (j) => PaginatedCvsAuthorizations.fromJson(j),
      'getCvsAuthorizations',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'accountId': accountId,
        'before': before,
        'after': after,
        'perPage': perPage,
      },
    );
  }

  Future<NoContent> cancelCvsAuthorization({
    required String accountId,
    required String orderId,
  }) async {
    return await invokeMethod<NoContent>(
      (j) => NoContent.fromJson(j),
      'cancelCvsAuthorization',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'accountId': accountId,
        'orderId': orderId,
      },
    );
  }
}
