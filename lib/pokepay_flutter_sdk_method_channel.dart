import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pokepay_flutter_sdk/responses/access_token.dart';
import 'package:pokepay_flutter_sdk/responses/error.dart';
import '/pokepay_sdk.dart';

import 'parameters/product.dart';
import 'pokepay_flutter_sdk_platform_interface.dart';
import 'responses/user_transaction.dart';

/// An implementation of [PokepayFlutterSdkPlatform] that uses method channels.
class MethodChannelPokepayFlutterSdk extends PokepayFlutterSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('jp.pokepay/pokepay_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<T> invokeMethod<T>(T Function(Map<String, dynamic> data) factory,String methodName, Map<String, dynamic> args) async {
    try {
      final String json = await methodChannel.invokeMethod(methodName, args);
      return factory(jsonDecode(json));
    } on PlatformException catch (e) {
      final String code = e.code;
      final String message = e.message??"";
      if (code == "APIRequestError") {
        final APIRequestError err = APIRequestError.fromJson(jsonDecode(message));
        throw err;
      } else if (code == "OAuthRequestError") {
        final OAuthRequestError err = OAuthRequestError.fromJson(jsonDecode(message));
        throw err;
      } else {
        final ProcessingError err = ProcessingError.fromJson(jsonDecode(message));
        throw err;
      }
    }
  }

  @override
  Future<AccessToken> getAccessToken(String code,APIEnv env,String clientId,String clientSecret)async {
    final String json = await methodChannel.invokeMethod('exchangeAuthCode', {
      'env' : envToInt(env),
      'code': code,
      'clientId': clientId,
      'clientSecret': clientSecret,
    });
    return AccessToken.fromJson(jsonDecode(json));
  }

  @override
  String getAuthorizationUrl(APIEnv env,String clientId,{String contact = ""}) {
    String base = "${getWebBaseURL(env)}/oauth/authorize?client_id=$clientId&response_type=code";
    if (contact.isNotEmpty) {
      return "$base&contact=${Uri.encodeFull(contact)}";
    } else {
      return base;
    }
  }

  @override
  Future<UserTransaction> scanToken({
    required String scanToken,
    double? amount,
    String? accountId,
    List<Product>? products,
    String? couponId,
    required APIEnv env,
    required String accessToken
  }) async {
    String json = await methodChannel.invokeMethod('scanToken',{
      'env': envToInt(env),
      'accessToken': accessToken,
      'scanToken': scanToken,
      'amount': amount,
      'accountId': accountId,
      'products': products,
      'couponId': couponId,
    });
    return UserTransaction.fromJson(jsonDecode(json));
  }

  @override
  Future<String> createToken({
    required bool isMerchant,
    required double amount,
    String? description,
    int? expiresIn,
    String? accountId,
    List<Product>? products,
    required APIEnv env,
    required String accessToken
  }) async {
    String json = await methodChannel.invokeMethod('createToken', {
      'env': envToInt(env),
      'accessToken': accessToken,
      'isMerchant': isMerchant,
      'amount': amount,
      'description': description,
      'expiresIn': expiresIn,
      'accountId': accountId,
      'products': products
    });
    return json;
  }

  @override
  Future<UserTransaction> invokeToken({
    required String token,
    required APIEnv env,
    required String accessToken
  }) async {
    String json = await methodChannel.invokeMethod('scanToken', {
      'env': envToInt(env),
      'accessToken': accessToken,
      'token': token,
    });
    return UserTransaction.fromJson(jsonDecode(json));
  }

}
