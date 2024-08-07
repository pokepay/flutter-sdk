import 'package:pokepay_sdk/responses/veritrans_token.dart';

import '../pokepay_sdk.dart';

class VeritransAPI {
  Future<VeritransToken> getVeritransToken({
    required String cardNumber,
    required String cardExpiryDate,
    required String securityCode,
    required String tokenApiKey,
    required String cardholderName,
  }) async {
    return await invokeMethod<VeritransToken>(
      (j) => VeritransToken.fromJson(j),
      'getVeritransToken',
      {
        'cardNumber': cardNumber,
        'cardExpiryDate': cardExpiryDate,
        'securityCode': securityCode,
        'tokenApiKey': tokenApiKey,
        'cardholderName': cardholderName,
      },
    );
  }
}