import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:pokepay_flutter_sdk/parameters/product.dart';
import 'package:pokepay_flutter_sdk/pokepay_sdk.dart';
import 'package:pokepay_flutter_sdk/responses/user_transaction.dart';

import 'pokepay_flutter_sdk_method_channel.dart';
import 'responses/access_token.dart';

abstract class PokepayFlutterSdkPlatform extends PlatformInterface {
  /// Constructs a PokepayFlutterSdkPlatform.
  PokepayFlutterSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static PokepayFlutterSdkPlatform _instance = MethodChannelPokepayFlutterSdk();

  /// The default instance of [PokepayFlutterSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelPokepayFlutterSdk].
  static PokepayFlutterSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PokepayFlutterSdkPlatform] when
  /// they register themselves.
  static set instance(PokepayFlutterSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion();

  Future<T> invokeMethod<T>(T Function(Map<String, dynamic> data) factory, String methodName, Map<String, dynamic> args);

  Future<AccessToken> getAccessToken(String code, APIEnv env, String clientId, String clientSecret);

  String getAuthorizationUrl(APIEnv env, String clientId, {String contact = ""});

  Future<UserTransaction> scanToken({required String scanToken, double? amount, String? accountId, List<Product>? products, String? couponId,
  required APIEnv env,
    required String accessToken});

  Future<String> createToken({
    required bool isMerchant,
    required double amount,
    String? description,
    int? expiresIn,
    String? accountId,
    List<Product>? products,
    required APIEnv env,
    required String accessToken
  });

  Future<UserTransaction> invokeToken({
    required String token,
    required APIEnv env,
    required String accessToken
  });

}
