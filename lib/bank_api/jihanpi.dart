import 'package:pokepay_sdk/pokepay_sdk.dart';
import 'package:pokepay_sdk/responses.dart';

extension JihanpiAPI on PokepayAPI {
  Future<JihanpiTransaction> createJihanpiTransaction({
    required String nfcTagId,
    required String accountId,
    String? requestId,
    String? strategy,
  }) async {
    return await invokeMethod<JihanpiTransaction>(
      (j) => JihanpiTransaction.fromJson(j),
      'createJihanpiTransaction',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'nfcTagId': nfcTagId,
        'accountId': accountId,
        'requestId': requestId,
        'strategy': strategy,
      },
    );
  }

  Future<JihanpiTransaction> getJihanpiTransactionByOrderId({
    required String orderId,
  }) async {
    return await invokeMethod<JihanpiTransaction>(
      (j) => JihanpiTransaction.fromJson(j),
      'getJihanpiTransactionByOrderId',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'orderId': orderId,
      },
    );
  }

  Future<JihanpiTransaction> getJihanpiTransactionByRequestId({
    required String requestId,
  }) async {
    return await invokeMethod<JihanpiTransaction>(
      (j) => JihanpiTransaction.fromJson(j),
      'getJihanpiTransactionByRequestId',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'requestId': requestId,
      },
    );
  }
}
