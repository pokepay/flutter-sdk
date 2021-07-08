import 'package:meta/meta.dart';

import '../pokepay_sdk.dart';
import '../responses.dart';

extension AccountAPI on PokepayAPI {
  Future<AccountCpmToken> getCpmToken({
    @required String cpmToken,
  }) async {
    return await invokeMethod<AccountCpmToken>(
      (j) => AccountCpmToken.fromJson(j),
      'getCpmToken',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'cpmToken': cpmToken,
      },
    );
  }
}
