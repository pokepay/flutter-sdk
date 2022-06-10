import 'dart:io';

import '../pokepay_sdk.dart';
import '../pokepay_flutter_sdk_platform_interface.dart';
import '/responses/coupon_detail.dart';
import '/responses/paginated_coupons.dart';
import '../responses.dart';

enum CpmTokenScope {
  none, // = 0
  payemnt,
  topup,
  both,
}

extension AccountAPI on PokepayAPI {


  Future<AccountCpmToken> getCpmToken({
    required String cpmToken,
  }) async {
    
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<AccountCpmToken>(
          (j) => AccountCpmToken.fromJson(j),
      'getCpmToken',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'cpmToken': cpmToken,
      },
    );
  }

  Future<Account> createAccount({
    required String name,
    required String privateMoneyId,
     String? externalId,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<Account>(
      (j) => Account.fromJson(j),
      'createAccount',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'name': name,
        'privateMoneyId': privateMoneyId,
        'externalId': externalId,
      },
    );
  }

  Future<AccountCpmToken> createAccountCpmToken({
    required String? accountId,
    required CpmTokenScope? scopes,
    int? expiresIn,
    Map<String, String>? metadata,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<AccountCpmToken>(
      (j) => AccountCpmToken.fromJson(j),
      'createAccountCpmToken',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'accountId': accountId,
        'scopes': scopes!.index,
        'expiresIn': expiresIn,
        'metadata' : metadata??(Platform.isIOS?null:{}),
      },
    );
  }

  Future<Account> getAccount({
    required String? id,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<Account>(
      (j) => Account.fromJson(j),
      'getAccount',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
      },
    );
  }

  Future<PaginatedAccountBalances> getAccountBalances({
    required String? id,
    String? before,
    String? after,
    int? perPage,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<PaginatedAccountBalances>(
      (j) => PaginatedAccountBalances.fromJson(j),
      'getAccountBalances',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
        'before': before,
        'after': after,
        'perPage': perPage,
      },
    );
  }
  Future<PaginatedCoupons> getAccountCoupons({
    required String accountId,
    bool? isAvailable,
    String? before,
    String? after,
    int? perPage,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<PaginatedCoupons>(
          (j) => PaginatedCoupons.fromJson(j),
      'getAccountCoupons',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'accountId': accountId,
        'isAvailable': isAvailable,
        'before': before,
        'after': after,
        'perPage': perPage,
      },
    );
  }

  Future<CouponDetail> getAccountCouponDetail({
    required String? accountId,
    required String? couponId,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<CouponDetail>(
          (j) => CouponDetail.fromJson(j),
      'getAccountCouponDetail',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'accountId': accountId,
        'couponId': couponId,
      },
    );
  }
  Future<PaginatedTransactions> getAccounTransactions({
    required String id,
    String? before,
    String? after,
    int? perPage,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<PaginatedTransactions>(
      (j) => PaginatedTransactions.fromJson(j),
      'getAccountTransactions',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
        'before': before,
        'after': after,
        'perPage': perPage,
      },
    );
  }

  Future<CouponDetail> patchAccountCouponDetail({
    required String accountId,
    required String couponId,
    required bool isReceieved,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<CouponDetail>(
          (j) => CouponDetail.fromJson(j),
      'patchAccountCouponDetail',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'accountId': accountId,
        'couponId': couponId,
        'is_received': isReceieved,
      },
    );
  }
}
