import '../pokepay_sdk.dart';
import '../responses.dart';

extension PrivateMoney on PokepayAPI {
  Future<PaginatedPrivateMoneys> searchPrivateMoneys({
    String name,
    bool includeExclusive = false,
    String before,
    String after,
    int perPage,
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
}
