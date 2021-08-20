import 'dart:convert';

import 'package:meta/meta.dart';

import '../parameters/product.dart';
import '../pokepay_sdk.dart';
import '../responses.dart';

extension TransactionAPI on PokepayAPI {
  Future<UserTransaction> createUserTransactionWithBill({
    @required String billId,
    String accountId,
    double amount,
    String couponId,
  }) async {
    return await invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'createUserTransactionWithBill',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'billId': billId,
        'accountId': accountId,
        'amount': amount,
        'couponId' : couponId,
      },
    );
  }

  Future<UserTransaction> createUserTransactionWithCashtray({
    @required String cashtrayId,
    String accountId,
    String couponId,
  }) async {
    return await invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'createUserTransactionWithCashtray',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'cashtrayId': cashtrayId,
        'accountId': accountId,
        'couponId' : couponId,
      },
    );
  }

  Future<UserTransaction> createUserTransactionWithCheck({
    @required String checkId,
    String accountId,
  }) async {
    return await invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'createUserTransactionWithCheck',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'checkId': checkId,
        'accountId': accountId,
      },
    );
  }

  Future<UserTransaction> createUserTransactionWithCpm({
    @required String cpmToken,
    String accountId,
    @required double amount,
    List<Product> products,
  }) async {
    return await invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'createUserTransactionWithCpm',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'cpmToken': cpmToken,
        'accountId': accountId,
        'amount': amount,
        'products': jsonEncode(products),
      },
    );
  }

  Future<JwtResult> createUserTransactionWithJwt({
    @required String data,
    String accountId,
    String couponId,
  }) async {
    return await invokeMethod<JwtResult>(
      (j) => JwtResult.fromJson(j),
      'createUserTransactionWithJwt',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'data': data,
        'accountId': accountId,
        'couponId' : couponId
      },
    );
  }

  Future<UserTransaction> getUserTransaction({
    @required String id,
  }) async {
    return await invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'getUserTransaction',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
      },
    );
  }

  Future<NoContent> cancelUserTransaction({
    @required String id,
  }) async {
    return await invokeMethod<NoContent>(
      (j) => NoContent.fromJson(j),
      'cancelUserTransaction',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
      },
    );
  }

  Future<UserTransaction> sendToAccount({
    @required String accountId,
    @required double amount,
    String receiverTerminalId,
    String senderAccountId,
    String description,
  }) async {
    return await invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'sendToAccount',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'accountId': accountId,
        'amount': amount,
        'receiverTerminalId': receiverTerminalId,
        'senderAccountId': senderAccountId,
        'description': description,
      },
    );
  }

  Future<UserTransaction> sendToUser({
    @required String userId,
    @required double amount,
    String receiverTerminalId,
    String senderAccountId,
    String description,
  }) async {
    return await invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'sendToUser',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'userId': userId,
        'amount': amount,
        'receiverTerminalId': receiverTerminalId,
        'senderAccountId': senderAccountId,
        'description': description,
      },
    );
  }
}
