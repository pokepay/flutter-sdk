import 'dart:convert';

import '../parameters/product.dart';
import '../pokepay_sdk.dart';

import '../pokepay_flutter_sdk_platform_interface.dart';
import '../responses.dart';

extension BillAPI on PokepayAPI {
  Future<Bill> createBill({
    double? amount,
    String? accountId,
    String? description,
    bool isOnetime = false,
    List<Product>? products,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<Bill>(
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
    required String? id,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<NoContent>(
      (j) => NoContent.fromJson(j),
      'deleteBill',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
      },
    );
  }

  Future<Bill> getBill({
    required String? id,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<Bill>(
      (j) => Bill.fromJson(j),
      'getBill',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
      },
    );
  }

  Future<Bill> updateBill({
    required String? id,
    double? amount,
    String? description,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<Bill>(
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
