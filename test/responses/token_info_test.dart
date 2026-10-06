import 'package:test/test.dart';

import 'package:pokepay_sdk/responses/cashtray.dart';
import 'package:pokepay_sdk/responses/token_info.dart';

/// Mimics the Cashtray JSON the server returns to the shop that created it.
Map<String, dynamic> cashtrayJson() => <String, dynamic>{
      'id': '7d1c2f0e-5a3b-4c6d-8e9f-0a1b2c3d4e5f',
      'amount': 1100.0,
      'description': '',
      'user': <String, dynamic>{
        'id': '4b4a2d5a-4d5c-4c1a-9c2f-2c5c9a5b1d3e',
        'name': 'test shop',
        'is_merchant': true,
      },
      'private_money': <String, dynamic>{
        'id': '9f1a0c33-6b4e-4a52-8d4a-1a2b3c4d5e6f',
        'name': 'test money',
        'type': 'own',
        'unit': '円',
        'description': 'money for tests',
        'oneline_message': '',
        'account_image': null,
        'images': <String, dynamic>{
          'card': null,
          '300x300': null,
          '600x600': null,
        },
        'organization': <String, dynamic>{
          'code': 'test',
          'name': 'test organization',
        },
        'max_balance': null,
        'transfer_limit': null,
        'expiration_type': 'unlimited',
        'is_exclusive': false,
        'terms_url': null,
        'privacy_policy_url': null,
        'payment_act_url': null,
        'commercial_act_url': null,
        'can_use_credit_card': false,
        'can_use_c2c_transfer': false,
        'custom_domain_name': null,
        'topup_methods': null,
      },
      'expires_at': '2026-11-20T06:56:43.091034Z',
      'canceled_at': null,
      'token':
          'https://www.pokepay.jp/cashtrays/7d1c2f0e-5a3b-4c6d-8e9f-0a1b2c3d4e5f',
      'attempt': null,
      'transaction': null,
    };

void main() {
  group('TokenInfo of a cashtray QR (what getTokenInfo returns)', () {
    // getTokenInfo only classifies a cashtray QR: the user who scanned it
    // cannot read the cashtray, so the token is an empty string.
    final scanned = TokenInfo(type: TokenType.CASHTRAY, token: '');

    test('toJson does not throw and keeps the empty token', () {
      expect(scanned.toJson(), <String, dynamic>{
        'type': 'CASHTRAY',
        'token': '',
      });
    });

    test('survives a toJson / fromJson round trip', () {
      final restored = TokenInfo.fromJson(scanned.toJson());

      expect(restored.type, TokenType.CASHTRAY);
      expect(restored.token, '');
    });
  });

  group('TokenInfo carrying a Cashtray', () {
    test('fromJson restores the token as a Cashtray', () {
      final info = TokenInfo.fromJson(<String, dynamic>{
        'type': 'CASHTRAY',
        'token': cashtrayJson(),
      });

      expect(info.token, isA<Cashtray>());
      expect((info.token as Cashtray).amount, 1100.0);
    });

    test('toJson serializes the Cashtray', () {
      final info = TokenInfo(
        type: TokenType.CASHTRAY,
        token: Cashtray.fromJson(cashtrayJson()),
      );

      final token = info.toJson()['token'] as Map<String, dynamic>;
      expect(token['id'], '7d1c2f0e-5a3b-4c6d-8e9f-0a1b2c3d4e5f');
    });
  });
}
