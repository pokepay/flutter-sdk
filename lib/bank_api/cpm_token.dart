import '../pokepay_sdk.dart';
import '../responses.dart';

extension AccountAPI on PokepayAPI {
  Future<AccountCpmToken> getCpmToken({
    required String cpmToken,
    Map<String, String>? metadata,
  }) async {
    return await invokeMethod<AccountCpmToken>(
      (j) => AccountCpmToken.fromJson(j),
      'getCpmToken',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'cpmToken': cpmToken,
        'metadata': metadata,
      },
    );
  }
}
