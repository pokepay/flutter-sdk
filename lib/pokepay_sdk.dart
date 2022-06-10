

import 'dart:async';
import 'bank_api/terminal.dart';
import 'bank_api/transaction.dart';
import 'parameters/product.dart';
import 'pokepay_flutter_sdk_platform_interface.dart';
import 'responses.dart';
import 'bank_api/bill.dart';
import 'bank_api/check.dart';
import 'bank_api/account.dart';

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
int envToInt(APIEnv apiEnv) {
  switch (apiEnv) {
    case APIEnv.PRODUCTION:
      return 0;
    case APIEnv.SANDBOX:
      return 1;
    case APIEnv.QA:
      return 2;
    case APIEnv.DEVELOPMENT:
      return 3;
    default:
      return 3;
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

// var logger = (() {
//   Logger.level = Level.warning;
//   Logger rt = new Logger(
//     printer: PrettyPrinter(
//       methodCount: 2, // number of method calls to be displayed
//       errorMethodCount: 8, // number of method calls if stacktrace is provided
//       lineLength: 120, // width of the output
//       colors: true, // Colorful log messages
//       printEmojis: false, // Print an emoji for each log message
//       printTime: true, // Should each log print contain a timestamp
//     ),
//   );
//   return rt;
// })();

// void setLogLevel(LogLevel lev) {
//   Level l;
//   switch (lev) {
//     case LogLevel.verbose:
//       l = Level.verbose;
//       break;
//     case LogLevel.debug:
//       l = Level.debug;
//       break;
//     case LogLevel.info:
//       l = Level.info;
//       break;
//     case LogLevel.warning:
//       l = Level.warning;
//       break;
//     case LogLevel.error:
//       l = Level.error;
//       break;
//     case LogLevel.wtf:
//       l = Level.wtf;
//       break;
//   }
//   Logger.level = l;
//   logger = new Logger(
//     printer: PrettyPrinter(
//       methodCount: 2, // number of method calls to be displayed
//       errorMethodCount: 8, // number of method calls if stacktrace is provided
//       lineLength: 120, // width of the output
//       colors: true, // Colorful log messages
//       printEmojis: false, // Print an emoji for each log message
//       printTime: true, // Should each log print contain a timestamp
//     ),
//   );
// }

const Map<APIEnv, String> envNameMap = {
  APIEnv.PRODUCTION: "",
  APIEnv.SANDBOX: "sandbox",
  APIEnv.QA: "qa",
  APIEnv.DEVELOPMENT: "dev",
};

String getWebBaseURL(APIEnv env) {
  String name = envNameMap[env]!;
  String suffix = ((name.isNotEmpty) ? ("-$name") : "");
  return "https://www$suffix.pokepay.jp";
}

String getAPIBaseURL(APIEnv env) {
  String name = envNameMap[env]!;
  String suffix = ((name.isNotEmpty) ? ("-$name") : "");
  return "https://api$suffix.pokepay.jp";
}

class PokepayAPI {
  final APIEnv env;
  final String accessToken;

  PokepayAPI({
    required this.accessToken,
    required this.env,
  });
}

String parseAsPokeregiToken(String token) {
  // * {25 ALNUM} - (Pokeregi_V1 OfflineMode QR)
  final V1_QR_REG = RegExp(r'^([0-9A-Z]{25})$');
  // * https://www.pokepay.jp/pd?={25 ALNUM} - (Pokeregi_V1 OfflineMode NFC)
  // * https://www.pokepay.jp/pd/{25 ALNUM}  - (Pokeregi_V2 OfflineMode QR & NFC)
  final RegExp V1_NFC_V2_QR_NFC_REG = RegExp(r'^https://www(?:-dev|-sandbox|-qa|)\\.pokepay\\.jp/pd(?:/|\\?d=)([0-9A-Z]{25})$');
  // matching
  final v1 = V1_QR_REG.allMatches(token);
  if (V1_QR_REG.hasMatch(token)) {
    return v1.elementAt(0).group(1) ?? "";
  }
  final v2 = V1_NFC_V2_QR_NFC_REG.allMatches(token);
  if (V1_NFC_V2_QR_NFC_REG.hasMatch(token)) {
    return v2.elementAt(0).group(1) ?? "";
  }
  return "";
}

class PokepayClient {
  PokepayAPI api;

  PokepayClient({
    required String accessToken,
    required APIEnv env,
  }) : api = PokepayAPI(
    accessToken: accessToken,
    env: env,
  );

  Future<Terminal> getTerminalInfo() async {
    return api.getTerminal();
  }

  Future<TokenInfo> getTokenInfo(String token) async {
    if (token.startsWith("${getWebBaseURL(api.env)}/cashtrays/")) {
      return TokenInfo(type: TokenType.CASHTRAY, token: "");
    } else if (token.startsWith("${getWebBaseURL(api.env)}/bills/")) {
      final String uuid = token.substring(("${getWebBaseURL(api.env)}/bills/").length);
      final bill = await api.getBill(id: uuid);
      return TokenInfo(type: TokenType.BILL, token: token, bill: bill);
    } else if (token.startsWith("${getWebBaseURL(api.env)}/checks/")) {
      final String uuid = token.substring(("${getWebBaseURL(api.env)}/checks/").length);
      final check = await api.getCheck(id: uuid);
      return TokenInfo(type: TokenType.CHECK, token: token, check: check);
    } else if (RegExp(r'^([0-9A-Z]{25})$').hasMatch(token)) {
      final cpmToken = await api.getCpmToken(cpmToken: token);
      return TokenInfo(type: TokenType.CPM, token: token, cpmToken: cpmToken);
    } else {
      String key = parseAsPokeregiToken(token);
      if (key.isNotEmpty) {
        return TokenInfo(type: TokenType.PAYREGI, token: "");
      }
    }
    return TokenInfo(type: TokenType.UNKNOWN, token: "");
  }

  Future<UserTransaction> pay({
    required Bill bill,
    double? amount,
  }) async {
    if (bill.amount != null && bill.amount != 0) {
      if (amount != 0) {
        // logger.w(
        //   "You set amount on having price bill. The amount will be ignored.",
        // );
      }
      amount = null;
    }
    return await api.createUserTransactionWithBill(
      billId: bill.token,
      amount: amount,
    );
  }

  Future<UserTransaction> topup({required Check check, String? accountId}) async {
    return await api.createUserTransactionWithCheck(checkId: check.id, accountId: accountId);
  }

  Future<UserTransaction> invokeToken({required String token}) async {
    return PokepayFlutterSdkPlatform.instance.invokeToken(token: token, env: api.env, accessToken: api.accessToken);
  }

  Future<String> createToken({
    required bool isMerchant,
    required double amount,
    String? description,
    int? expiresIn,
    String? accountId,
    List<Product>? products,
  }) async {
    return PokepayFlutterSdkPlatform.instance.createToken(
      env: api.env,
      accessToken: api.accessToken,
      isMerchant: isMerchant,
      amount: amount,
      description: description,
      expiresIn: expiresIn,
      accountId: accountId,
      products: products,
    );
  }

  Future<UserTransaction> scanToken({
    required String scanToken,
    double? amount,
    String? accountId,
    List<Product>? products,
    String? couponId,
  }) async {
    return PokepayFlutterSdkPlatform.instance.scanToken(
      scanToken: scanToken,
      env: api.env,
      accessToken: api.accessToken,
      amount: amount,
      accountId: accountId,
      products: products,
      couponId: couponId,
    );
  }
}

class PokepayOAuthClient {
  final String clientId;
  final String clientSecret;
  final APIEnv env;

  PokepayOAuthClient({
    required this.env,
    required this.clientId,
    required this.clientSecret,
  });

  String getAuthorizationUrl({String contact = ""}) {
    return PokepayFlutterSdkPlatform.instance.getAuthorizationUrl(env, clientId, contact: contact);
  }

  Future<AccessToken> getAccessToken(String code) async {
    return PokepayFlutterSdkPlatform.instance.getAccessToken(code, env, clientId, clientSecret);
  }
}
