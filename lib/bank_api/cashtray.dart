import 'dart:convert';

import '../parameters/product.dart';
import '../pokepay_sdk.dart';
import '../pokepay_flutter_sdk_platform_interface.dart';
import '../responses.dart';

extension CashtrayAPI on PokepayAPI {
  Future<Cashtray> createCashtray({
    required double amount,
    String? description,
    int? expiresIn,
    List<Product>? products,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<Cashtray>(
      (j) => Cashtray.fromJson(j),
      'createCashtray',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'amount': amount,
        'description': description,
        'expiresIn': expiresIn,
        'products': jsonEncode(products),
      },
    );
  }

  Future<NoContent> deleteCashtray({
    required String? id,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<NoContent>(
      (j) => NoContent.fromJson(j),
      'deleteCashtray',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
      },
    );
  }

  Future<Cashtray> getCashtray({
    required String id,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<Cashtray>(
      (j) => Cashtray.fromJson(j),
      'getCashtray',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
      },
    );
  }

  @deprecated
  Future<CashtrayAttempts> getCashtrayAttempts({
    required String id,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<CashtrayAttempts>(
      (j) => CashtrayAttempts.fromJson(j),
      'getCashtrayAttempts',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
      },
    );
  }

  Future<Cashtray> updateCashtray({
    required String id,
    double? amount,
    String? description,
    int? expiresIn,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<Cashtray>(
      (j) => Cashtray.fromJson(j),
      'updateCashtray',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
        'amount': amount,
        'description': description,
        'expiresIn': expiresIn,
      },
    );
  }
}
