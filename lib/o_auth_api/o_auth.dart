import '../pokepay_sdk.dart';
import '../responses.dart';

class PokepayOAuthAPI {
  final APIEnv env;

  PokepayOAuthAPI({this.env = APIEnv.PRODUCTION});

  Future<AccessToken> exchangeAuthCode({
    required String code,
    required String clientId,
    required String clientSecret,
    String grantType = "authorization_code",
  }) async {
    return await invokeMethod<AccessToken>((j) => AccessToken.fromJson(j), 'exchangeAuthCode', {
      'env': this.env.index,
      'code': code,
      'clientId': clientId,
      'clientSecret': clientSecret,
      'grantType': grantType,
    });
  }

  Future<AccessToken> exchangeDelegationCode({
    required String code,
    required String clientId,
    required String clientSecret,
    String grantType = "urn:pokepay:delegation-code",
  }) async {
    return await invokeMethod<AccessToken>((j) => AccessToken.fromJson(j), 'exchangeDelegationCode', {
      'env': this.env.index,
      'code': code,
      'clientId': clientId,
      'clientSecret': clientSecret,
      'grantType': grantType,
    });
  }

  Future<AccessToken> refreshAccessToken({
    required String refreshToken,
    required String clientId,
    required String clientSecret,
    String grantType = "refresh_token",
  }) async {
    return await invokeMethod<AccessToken>((j) => AccessToken.fromJson(j), 'refreshAccessToken', {
      'env': this.env.index,
      'refreshToken': refreshToken,
      'clientId': clientId,
      'clientSecret': clientSecret,
      'grantType': grantType,
    });
  }

  Future<ExchangedToken> exchangeToken({
    required String clientId,
    required String clientSecret,
    String? resource,
    String? audience,
    required String subjectToken,
    required String subjectTokenType,
    String? requestedTokenType,
    List<String>? scopes,
    String? actorTokenType,
    String? actorToken,
  }) async {
    return await invokeMethod<ExchangedToken>((j) => ExchangedToken.fromJson(j), 'exchangeToken', {
      'env': this.env.index,
      'clientId': clientId,
      'clientSecret': clientSecret,
      'resource': resource,
      'audience': audience,
      'subjectToken': subjectToken,
      'subjectTokenType': subjectTokenType,
      'requestedTokenType': requestedTokenType,
      'scopes': scopes,
      'actorTokenType': actorTokenType,
      'actorToken': actorToken,
    });
  }
}
