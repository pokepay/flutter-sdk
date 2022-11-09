import 'package:pokepay_flutter_sdk/responses.dart';
import 'package:pokepay_flutter_sdk/responses/paginated_coupons.dart';

import '../pokepay_sdk.dart';
import '../responses/private_money.dart' as response;

extension PrivateMoney on PokepayAPI {
  Future<PaginatedPrivateMoneys> searchPrivateMoneys({
    String? name,
    bool includeExclusive = false,
    String? before,
    String? after,
    int? perPage,
  }) async {
    return await invokeMethod<PaginatedPrivateMoneys>(
      (j) => PaginatedPrivateMoneys.fromJson(j),
      'searchPrivateMoneys',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'name': name,
        'includeExclusive': includeExclusive,
        'before': before,
        'after': after,
        'perPage': perPage,
      },
    );
  }

  Future<PaginatedCoupons> getPrivateMoneyCoupons({
    required String privateMoneyId,
    String? before,
    String? after,
    int? perPage,
  }) async {
    return await invokeMethod<PaginatedCoupons>(
      (j) => PaginatedCoupons.fromJson(j),
      'getPrivateMoneyCoupons',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'privateMoneyId': privateMoneyId,
        'before': before,
        'after': after,
        'perPage': perPage,
      },
    );
  }

  Future<response.PrivateMoney> getPrivateMoney({
    required String privateMoneyId,
  }) async {
    return await invokeMethod<response.PrivateMoney>(
      (j) => response.PrivateMoney.fromJson(j),
      "getPrivateMoney",
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'privateMoneyId': privateMoneyId,
      },
    );
  }
}
