import 'package:meta/meta.dart';

import '../custom_datetime_converter.dart';
import '../pokepay_sdk.dart';
import '../pokepay_flutter_sdk_platform_interface.dart';
import '../responses.dart';

var datetimeConv = CustomDateTimeConverter();

extension CheckAPI on PokepayAPI {
  Future<Check> createCheck({
    double? amount,
    double? moneyAmount,
    double? pointAmount,
    String? accountId,
    String? description,
    bool isOnetime = true, // check should be onetime default
    int? usageLimit,
    DateTime? expiresAt,
    DateTime? pointExpiresAt,
    int? pointExpiresInDays,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<Check>(
      (j) => Check.fromJson(j),
      'createCheck',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'amount': amount,
        'moneyAmount': moneyAmount,
        'pointAmount': pointAmount,
        'accountId': accountId,
        'description': description,
        'isOnetime': isOnetime,
        'usageLimit': usageLimit,
        'expiresAt': datetimeConv.toJson(expiresAt!),
        'pointExpiresAt': datetimeConv.toJson(pointExpiresAt!),
        'pointExpiresInDays': pointExpiresInDays,
      },
    );
  }

  Future<NoContent> deleteCheck({
    required String id,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<NoContent>(
      (j) => NoContent.fromJson(j),
      'deleteCheck',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
      },
    );
  }

  Future<Check> getCheck({
    required String id,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<Check>(
      (j) => Check.fromJson(j),
      'getCheck',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
      },
    );
  }

  Future<Check> updateCheck({
    required String id,
    double? amount,
    String? description,
    DateTime? expiresAt,
    DateTime? pointExpiresAt,
    int? pointExpiresInDays,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<Check>(
      (j) => Check.fromJson(j),
      'updateCheck',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
        'amount': amount,
        'description': description,
        'expiresAt': datetimeConv.toJson(expiresAt!),
        'pointExpiresAt': datetimeConv.toJson(pointExpiresAt!),
        'pointExpiresInDays': pointExpiresInDays,
      },
    );
  }
}
