import 'dart:convert';

import '../parameters/transaction_strategy.dart';

import '../parameters/product.dart';
import '../pokepay_sdk.dart';
import '../responses.dart';

extension TransactionAPI on PokepayAPI {
  Future<UserTransaction> createUserTransactionWithBill({
    required String billId,
    String? accountId,
    double? amount,
    String? couponId,
    TransactionStrategy strategy = TransactionStrategy.POINT_PREFERRED,
    String? requestId,
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
        'couponId': couponId,
        'tx_strategy': strategy.value,
        'requestId': requestId,
      },
    );
  }

  Future<UserTransaction> createUserTransactionWithCashtray({
    required String cashtrayId,
    String? accountId,
    String? couponId,
    TransactionStrategy strategy = TransactionStrategy.POINT_PREFERRED,
    String? requestId,
  }) async {
    return await invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'createUserTransactionWithCashtray',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'cashtrayId': cashtrayId,
        'accountId': accountId,
        'couponId': couponId,
        'tx_strategy': strategy.value,
        'requestId': requestId,
      },
    );
  }

  Future<UserTransaction> createUserTransactionWithCheck({
    required String checkId,
    String? accountId,
    String? requestId,
  }) async {
    return await invokeMethod<UserTransaction>(
      (j) => UserTransaction.fromJson(j),
      'createUserTransactionWithCheck',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'checkId': checkId,
        'accountId': accountId,
        'requestId': requestId,
      },
    );
  }

  Future<UserTransaction> createUserTransactionWithCpm({
    required String cpmToken,
    String? accountId,
    required double amount,
    List<Product>? products,
    String? requestId,
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
        'requestId': requestId,
      },
    );
  }

  Future<JwtResult> createUserTransactionWithJwt({
    required String data,
    String? accountId,
    String? couponId,
    TransactionStrategy strategy = TransactionStrategy.POINT_PREFERRED,
  }) async {
    return await invokeMethod<JwtResult>(
      (j) => JwtResult.fromJson(j),
      'createUserTransactionWithJwt',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'data': data,
        'accountId': accountId,
        'couponId': couponId,
        'tx_strategy': strategy.value,
      },
    );
  }

  Future<UserTransaction> getUserTransaction({
    required String id,
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
    required String id,
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
    required String accountId,
    required double amount,
    String? receiverTerminalId,
    String? senderAccountId,
    String? description,
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
    required String userId,
    required double amount,
    String? receiverTerminalId,
    String? senderAccountId,
    String? description,
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
