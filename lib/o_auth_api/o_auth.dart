import 'package:meta/meta.dart';

import '../pokepay_sdk.dart';
import '../pokepay_flutter_sdk_platform_interface.dart';
import '../responses.dart';

class PokepayOAuthAPI {
  final APIEnv env;

  PokepayOAuthAPI({
    this.env = APIEnv.PRODUCTION,
  });

  Future<AccessToken> exchangeAuthCode({
    required String code,
    required String clientId,
    required String clientSecret,
    String grantType = "authorization_code",
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<AccessToken>(
      (j) => AccessToken.fromJson(j),
      'exchangeAuthCode',
      {
        'env': this.env.index,
        'code': code,
        'clinetId': clientId,
        'clientSecret': clientSecret,
        'grantType': grantType,
      },
    );
  }

  Future<AccessToken> refreshAccessToken({
    required String refreshToken,
    required String clientId,
    required String clientSecret,
    String grantType = "refresh_token",
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<AccessToken>(
      (j) => AccessToken.fromJson(j),
      'refreshAccessToken',
      {
        'env': this.env.index,
        'refreshToken': refreshToken,
        'clientId': clientId,
        'clientSecret': clientSecret,
        'grantType': grantType,
      },
    );
  }
}
