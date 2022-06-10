import 'dart:convert';

import 'package:meta/meta.dart';

import '../parameters/product.dart';
import '../pokepay_sdk.dart';
import '../pokepay_flutter_sdk_platform_interface.dart';
import '../responses.dart';

extension TransactionAPI on PokepayAPI {
  Future<UserTransaction> createUserTransactionWithBill({
    required String billId,
    String? accountId,
    double? amount,
    String? couponId,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'createUserTransactionWithBill',
      {
        'env': env.index,
        'accessToken': accessToken,
        'billId': billId,
        'accountId': accountId,
        'amount': amount,
        'couponId' : couponId,
      },
    );
  }

  Future<UserTransaction> createUserTransactionWithCashtray({
    required String cashtrayId,
    String? accountId,
    String? couponId,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'createUserTransactionWithCashtray',
      {
        'env': env.index,
        'accessToken': accessToken,
        'cashtrayId': cashtrayId,
        'accountId': accountId,
        'couponId' : couponId,
      },
    );
  }

  Future<UserTransaction> createUserTransactionWithCheck({
    required String checkId,
    String? accountId,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'createUserTransactionWithCheck',
      {
        'env': env.index,
        'accessToken': accessToken,
        'checkId': checkId,
        'accountId': accountId,
      },
    );
  }

  Future<UserTransaction> createUserTransactionWithCpm({
    required String cpmToken,
    String? accountId,
    required double amount,
    List<Product>? products,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'createUserTransactionWithCpm',
      {
        'env': env.index,
        'accessToken': accessToken,
        'cpmToken': cpmToken,
        'accountId': accountId,
        'amount': amount,
        'products': jsonEncode(products),
      },
    );
  }

  Future<JwtResult> createUserTransactionWithJwt({
    required String data,
    String? accountId,
    String? couponId,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<JwtResult>(
      (j) => JwtResult.fromJson(j),
      'createUserTransactionWithJwt',
      {
        'env': env.index,
        'accessToken': accessToken,
        'data': data,
        'accountId': accountId,
        'couponId' : couponId
      },
    );
  }

  Future<UserTransaction> getUserTransaction({
    required String id,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'getUserTransaction',
      {
        'env': env.index,
        'accessToken': accessToken,
        'id': id,
      },
    );
  }

  Future<NoContent> cancelUserTransaction({
    required String id,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<NoContent>(
      (j) => NoContent.fromJson(j),
      'cancelUserTransaction',
      {
        'env': env.index,
        'accessToken': accessToken,
        'id': id,
      },
    );
  }

  Future<UserTransaction> sendToAccount({
    required String accountId,
    required double amount,
    String? receiverTerminalId,
    String? senderAccountId,
    String? description,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'sendToAccount',
      {
        'env': env.index,
        'accessToken': accessToken,
        'accountId': accountId,
        'amount': amount,
        'receiverTerminalId': receiverTerminalId,
        'senderAccountId': senderAccountId,
        'description': description,
      },
    );
  }

  Future<UserTransaction> sendToUser({
    required String userId,
    required double amount,
    String? receiverTerminalId,
    String? senderAccountId,
    String? description,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'sendToUser',
      {
        'env': env.index,
        'accessToken': accessToken,
        'userId': userId,
        'amount': amount,
        'receiverTerminalId': receiverTerminalId,
        'senderAccountId': senderAccountId,
        'description': description,
      },
    );
  }
}
