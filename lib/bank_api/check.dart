import '../custom_datetime_converter.dart';
import '../pokepay_sdk.dart';
import '../responses.dart';

var datetimeConv = CustomDateTimeConverter();

extension CheckAPI on PokepayAPI {
  Future<Check> createCheck({
    double? amount,
    double? moneyAmount,
    double? pointAmount,
    String? accountId,
    String? description,
    bool? isOnetime = true, // check should be onetime default
    int? usageLimit,
    DateTime? expiresAt,
    DateTime? pointExpiresAt,
    int? pointExpiresInDays,
  }) async {
    return await invokeMethod<Check>(
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
        if(expiresAt != null)
          'expiresAt': datetimeConv.toJson(expiresAt),
        'pointExpiresInDays': pointExpiresInDays,
        if(pointExpiresAt != null)
          'pointExpiresAt': datetimeConv.toJson(pointExpiresAt),
      },
    );
  }

  Future<NoContent> deleteCheck({
    required String id,
  }) async {
    return await invokeMethod<NoContent>(
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
    return await invokeMethod<Check>(
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
    required DateTime expiresAt,
    required DateTime pointExpiresAt,
    int? pointExpiresInDays,
  }) async {
    return await invokeMethod<Check>(
      (j) => Check.fromJson(j),
      'updateCheck',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
        'amount': amount,
        'description': description,
        'expiresAt': datetimeConv.toJson(expiresAt),
        'pointExpiresAt': datetimeConv.toJson(pointExpiresAt),
        'pointExpiresInDays': pointExpiresInDays,
      },
    );
  }
}
