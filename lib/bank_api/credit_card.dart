
import 'package:pokepay_sdk/responses/credit_card.dart';
import 'package:pokepay_sdk/responses/paginated_credit_cards.dart';

import '../pokepay_sdk.dart';
import '../responses.dart';

extension CreditCardAPI on PokepayAPI {
  Future<CreditCard> createCreditCard({
    required String token,
    bool? isCardholderNameSpecified,
    String? organizationCode,
    required String userId,
  }) async {
    return await invokeMethod<CreditCard>(
      (j) => CreditCard.fromJson(j),
      'createCreditCard',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'token': token,
        'isCardholderNameSpecified': isCardholderNameSpecified,
        'organizationCode': organizationCode,
        'userId': userId,
      },
    );
  }

  Future<NoContent> deleteCreditCard({
    required String cardRegisteredAt,
    String? organizationCode,
    required String userId,
  }) async {
    return await invokeMethod<NoContent>(
      (j) => NoContent.fromJson(j),
      'deleteCreditCard',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'cardRegisteredAt': cardRegisteredAt,
        'organizationCode': organizationCode,
        'userId': userId,
      },
    );
  }

  Future<PaginatedCreditCards> getCreditCards({
    required String userId,
    String? before,
    String? after,
    int? perPage,
    String? organizationCode,
  }) async {
    return await invokeMethod<PaginatedCreditCards>(
      (j) => PaginatedCreditCards.fromJson(j),
      'getCreditCards',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'userId': userId,
        'before': before,
        'after': after,
        'perPage': perPage,
        'organizationCode': organizationCode,
      },
    );
  }

  Future<String> TopupWithCreditCardMdkToken({
    required String userId,
    required String token,
    required String accountId,
    required int amount,
    String? organizationCode,
    bool? isCardholderNameSpecified,
    String? requestId,
  }) async {
    return await invokeMethod<String>(
      (j) => j,
      'topupWithCreditCardMdkToken',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'userId': userId,
        'token': token,
        'accountId': accountId,
        'amount': amount,
        'organizationCode': organizationCode,
        'isCardholderNameSpecified': isCardholderNameSpecified,
        'requestId': requestId,
      },
    );
  }

  Future<String> TopupWithCreditCardMembership({
    required String userId,
    required String cardRegisteredAt,
    required String accountId,
    required int amount,
    bool? deleteCardIfAuthFail,
    String? organizationCode,
    String? requestId,
  }) async {
    return await invokeMethod<String>(
      (j) => j,
      'topupWithCreditCardMembership',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'userId': userId,
        'cardRegisteredAt': cardRegisteredAt,
        'accountId': accountId,
        'amount': amount,
        'deleteCardIfAuthFail': deleteCardIfAuthFail,
        'organizationCode': organizationCode,
        'requestId': requestId,
      },
    );
  }
}
