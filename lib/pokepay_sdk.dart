import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import 'bank_api/terminal.dart';
import 'bank_api/transaction.dart';
import 'parameters/product.dart';
import 'responses.dart';

enum APIEnv {
  PRODUCTION,
  SANDBOX,
  QA,
  DEVELOPMENT,
}

// In Android and iOS SDK plugin, flutterEnvToSDKEnv
// case 0: return Env.PRODUCTION;
// case 1: return Env.SANDBOX;
// case 2: return Env.QA;
// case 3: return Env.DEVELOPMENT;
// default: return Env.DEVELOPMENT;
int envToInt(APIEnv apiEnv){
  switch(apiEnv){
    case APIEnv.PRODUCTION: return 0;
    case APIEnv.SANDBOX: return 1;
    case APIEnv.QA: return 2;
    case APIEnv.DEVELOPMENT: return 3;
    default: return 3;
  }
}

enum LogLevel {
  verbose,
  debug,
  info,
  warning,
  error,
  wtf,
}

var logger = (() {
  Logger.level = Level.warning;
  Logger rt = new Logger(
    printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: false, // Print an emoji for each log message
      printTime: true, // Should each log print contain a timestamp
    ),
  );
  return rt;
})();

void setLogLevel(LogLevel lev) {
  Level l;
  switch (lev) {
    case LogLevel.verbose:
      l = Level.verbose;
      break;
    case LogLevel.debug:
      l = Level.debug;
      break;
    case LogLevel.info:
      l = Level.info;
      break;
    case LogLevel.warning:
      l = Level.warning;
      break;
    case LogLevel.error:
      l = Level.error;
      break;
    case LogLevel.wtf:
      l = Level.wtf;
      break;
  }
  Logger.level = l;
  logger = new Logger(
    printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: false, // Print an emoji for each log message
      printTime: true, // Should each log print contain a timestamp
    ),
  );
}

const MethodChannel channel = const MethodChannel('jp.pokepay/pokepay_sdk');

Future<T> invokeMethod<T>(T factory(Map<String, dynamic> data),
    String methodName, Map<String, dynamic> args) async {
  try {
    logger.d("methodName: " + methodName + " args: " + args.toString());
    final String json = await channel.invokeMethod(methodName, args);
    logger.d("json: " + json);
    return factory(jsonDecode(json));
  } on PlatformException catch (e) {
    final String code = e.code;
    final String message = e.message;
    if (code == "APIRequestError") {
      final APIRequestError err = APIRequestError.fromJson(jsonDecode(message));
      throw err;
    } else if (code == "OAuthRequestError") {
      final OAuthRequestError err =
          OAuthRequestError.fromJson(jsonDecode(message));
      throw err;
    } else {
      final ProcessingError err = ProcessingError.fromJson(jsonDecode(message));
      throw err;
    }
  }
}

const Map<APIEnv, String> envNameMap = {
  APIEnv.PRODUCTION: "",
  APIEnv.SANDBOX: "sandbox",
  APIEnv.QA: "qa",
  APIEnv.DEVELOPMENT: "dev",
};

String getWebBaseURL(APIEnv env) {
  String name = envNameMap[env];
  String suffix = ((name.length > 0) ? ("-" + name) : "");
  return "https://www" + suffix + ".pokepay.jp";
}

String getAPIBaseURL(APIEnv env) {
  String name = envNameMap[env];
  String suffix = ((name.length > 0) ? ("-" + name) : "");
  return "https://api" + suffix + ".pokepay.jp";
}

class PokepayAPI {
  final APIEnv env;
  final String accessToken;
  PokepayAPI({
    @required this.accessToken,
    @required this.env,
  });
}

class PokepayClient {
  PokepayAPI api;

  PokepayClient({
    @required String accessToken,
    APIEnv env = APIEnv.PRODUCTION,
  }) : this.api = PokepayAPI(
          accessToken: accessToken,
          env: env,
        );

  Future<Terminal> getTerminalInfo() async {
    return this.api.getTerminal();
  }

  Future<TokenInfo> getTokenInfo(String token) async {
    final String json = await channel.invokeMethod('getTokenInfo', {
      'env': envToInt(this.api.env),
      'accessToken': this.api.accessToken,
      'token': token,
    });
    return TokenInfo.fromJson(jsonDecode(json));
  }

  Future<UserTransaction> pay({
    @required Bill bill,
    double amount,
  }) async {
    if (bill.amount != null && bill.amount != 0) {
      if (amount != 0) {
        logger.w(
          "You set amount on having price bill. The amount will be ignored.",
        );
      }
      amount = null;
    }
    return await this.api.createUserTransactionWithBill(
          billId: bill.token,
          amount: amount,
        );
  }

  Future<UserTransaction> topup({
    @required Check check,
    String accountId
  }) async {
    return await this.api.createUserTransactionWithCheck(checkId: 'check.id', accountId: accountId);
  }

  Future<UserTransaction> invokeToken({
    @required String token,
  }) async {
    String json = await channel.invokeMethod('scanToken', {
      'env': envToInt(this.api.env),
      'accessToken': this.api.accessToken,
      'token': token,
    });
    return UserTransaction.fromJson(jsonDecode(json));
  }

  Future<String> createToken({
    @required bool isMerchant,
    @required double amount,
    @required String description,
    int expiresIn,
    String accountId,
    List<Product> products,
  }) async {
    String json = await channel.invokeMethod('createToken', {
      'env': envToInt(this.api.env),
      'accessToken': this.api.accessToken,
      'isMerchant': isMerchant,
      'amount': amount,
      'description': description,
      'expiresIn': expiresIn,
      'accountId': accountId,
      'products': products
    });

    return json;
  }

  Future<UserTransaction> scanToken({
    @required String scanToken,
    double amount,
    String accountId,
    List<Product> products,
  }) async {
    String json = await channel.invokeMethod('scanToken',{
      'env': envToInt(this.api.env),
      'accessToken': this.api.accessToken,
      'scanToken': scanToken,
      'amount': amount,
      'accountId': accountId,
      'products': products
    });

    return UserTransaction.fromJson(jsonDecode(json));
  }
}

class PokepayOAuthClient {
  final String clientId;
  final String clientSecret;
  final APIEnv env;

  PokepayOAuthClient({
    this.env = APIEnv.PRODUCTION,
    @required this.clientId,
    @required this.clientSecret,
  });

  String getAuthorizationUrl({String contact = ""}) {
    String base = getWebBaseURL(this.env) +
        "/oauth/authorize?client_id=" +
        this.clientId +
        "&response_type=code";
    if (contact.length > 0) {
      return base + "&contact=" + Uri.encodeFull(contact);
    } else {
      return base;
    }
  }

  Future<AccessToken> getAccessToken(String code) async {
    final String json = await channel.invokeMethod('exchangeAuthCode', {
      'env' : envToInt(this.env),
      'code': code,
      'clientId': this.clientId,
      'clientSecret': this.clientSecret,
    });
    return AccessToken.fromJson(jsonDecode(json));
  }
}