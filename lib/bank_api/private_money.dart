import 'package:meta/meta.dart';
import '../pokepay_flutter_sdk_platform_interface.dart';
import '/responses/paginated_coupons.dart';

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
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<PaginatedPrivateMoneys>(
      (j) => PaginatedPrivateMoneys.fromJson(j),
      'searchPrivateMoneys',
      {
        'env': env.index,
        'accessToken': accessToken,
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
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<PaginatedCoupons>(
          (j) => PaginatedCoupons.fromJson(j),
      'getPrivateMoneyCoupons',
      {
        'env': env.index,
        'accessToken': accessToken,
        'privateMoneyId': privateMoneyId,
        'before': before,
        'after': after,
        'perPage': perPage,
      },
    );
  }
}
