import 'package:pokepay_sdk/responses/account_topup_stats.dart';

import '../parameters/gender.dart';
import '../responses/identification_result.dart';
import '../responses/coupon_detail.dart';
import '../responses/paginated_coupons.dart';
import '../responses/account_campaign_point_amounts.dart';

import '../pokepay_sdk.dart';
import '../responses.dart';

enum CpmTokenScope {
  none, // = 0
  payment,
  topup,
  both,
}

extension AccountAPI on PokepayAPI {
  Future<Account> createAccount({
    String? name,
    required String privateMoneyId,
    String? externalId,
  }) async {
    return await invokeMethod<Account>(
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
    required String accountId,
    required CpmTokenScope scopes,
    int? expiresIn,
    Map<String, String>? metadata,
  }) async {
    return await invokeMethod<AccountCpmToken>(
      (j) => AccountCpmToken.fromJson(j),
      'createAccountCpmToken',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'accountId': accountId,
        'scopes': scopes.index,
        'expiresIn': expiresIn,
        'metadata': metadata,
      },
    );
  }

  Future<Account> getAccount({
    required String id,
  }) async {
    return await invokeMethod<Account>(
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
    required String id,
    String? before,
    String? after,
    int? perPage,
  }) async {
    return await invokeMethod<PaginatedAccountBalances>(
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
    bool isAvailable = true,
    String? before,
    String? after,
    int? perPage,
  }) async {
    return await invokeMethod<PaginatedCoupons>(
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
    required String accountId,
    required String couponId,
  }) async {
    return await invokeMethod<CouponDetail>(
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

  Future<PaginatedTransactions> getAccountTransactions({
    required String id,
    String? before,
    String? after,
    int? perPage,
  }) async {
    return await invokeMethod<PaginatedTransactions>(
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
    required bool isReceived,
  }) async {
    return await invokeMethod<CouponDetail>(
      (j) => CouponDetail.fromJson(j),
      'patchAccountCouponDetail',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'accountId': accountId,
        'couponId': couponId,
        'is_received': isReceived,
      },
    );
  }

  Future<IdentificationResult> identifyIndividual({
    required String accountId,
    required String signature,
    required String signingCert,
    required String expectedHash,
    String? name,
    Gender? gender,
    String? address,
    String? dateOfBirth,
  }) async {
    return await invokeMethod<IdentificationResult>(
      (j) => IdentificationResult.fromJson(j),
      'identifyIndividual',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'accountId': accountId,
        'signature': signature,
        'signingCert': signingCert,
        'expectedHash': expectedHash,
        'name': name,
        'gender': gender?.value,
        'address': address,
        'dateOfBirth': dateOfBirth,
      },
    );
  }

  Future<AccountCampaignPointAmounts> getAccountCampaignPointAmounts({
    required String accountId,
    required String campaignId,
  }) async {
    return await invokeMethod<AccountCampaignPointAmounts>(
      (j) => AccountCampaignPointAmounts.fromJson(j),
      'getAccountCampaignPointAmounts',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'accountId': accountId,
        'campaignId': campaignId,
      },
    );
  }

  Future<AccountTopupStats> getAccountTopupStats({
    required String accountId,
  }) async {
    return await invokeMethod<AccountTopupStats>(
      (j) => AccountTopupStats.fromJson(j),
      'getAccountTopupStats',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'accountId': accountId,
      },
    );
  }
}
