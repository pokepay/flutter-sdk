import 'dart:convert';

import 'package:pokepay_sdk/responses/bill_with_additional_private_moneys.dart';

import '../parameters/product.dart';
import '../pokepay_sdk.dart';
import '../responses.dart';

extension BillAPI on PokepayAPI {
  Future<Bill> createBill({
    double? amount,
    String? accountId,
    String? description,
    bool isOnetime = false,
    List<Product>? products,
  }) async {
    return await invokeMethod<Bill>(
      (j) => Bill.fromJson(j),
      'createBill',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'amount': amount,
        'accountId': accountId,
        'description': description,
        'isOnetime': isOnetime,
        'products': jsonEncode(products),
      },
    );
  }

  Future<NoContent> deleteBill({
    required String id,
  }) async {
    return await invokeMethod<NoContent>(
      (j) => NoContent.fromJson(j),
      'deleteBill',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
      },
    );
  }

  Future<BillWithAdditionalPrivateMoneys> getBill({
    required String id,
  }) async {
    return await invokeMethod<BillWithAdditionalPrivateMoneys>(
      (j) => BillWithAdditionalPrivateMoneys.fromJson(j),
      'getBill',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
      },
    );
  }

  Future<Bill> updateBill({
    required String id,
    double? amount,
    String? description,
  }) async {
    return await invokeMethod<Bill>(
      (j) => Bill.fromJson(j),
      'updateBill',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
        'amount': amount,
        'description': description,
      },
    );
  }
}
