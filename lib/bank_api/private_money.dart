import 'package:pokepay_flutter_sdk/responses/paginated_coupons.dart';

import '../pokepay_sdk.dart';
import '../responses.dart';

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
}
