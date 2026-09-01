import 'package:test/test.dart';

import 'package:pokepay_sdk/responses/check.dart';
import 'package:pokepay_sdk/responses/token_info.dart';

/// Mimics the Check JSON the native side pushes over the MethodChannel
/// (iOS: APIJSONEncoder in SwiftPokepaySdkPlugin, Android: Response.toString
/// in pokepaylib). Only expires_at varies, so each test can check how a
/// particular date format is handled.
Map<String, dynamic> checkJson(String expiresAt) => <String, dynamic>{
      'id': 'b3f04a3f-0a17-42a4-85f1-1376a4f07c07',
      'amount': 1000.0,
      'money_amount': 1000.0,
      'point_amount': 0.0,
      'description': 'topup QR',
      'user': <String, dynamic>{
        'id': '4b4a2d5a-4d5c-4c1a-9c2f-2c5c9a5b1d3e',
        'name': 'test user',
        'is_merchant': false,
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
      'is_onetime': true,
      'is_disabled': false,
      'expires_at': expiresAt,
      'point_expires_at': null,
      'point_expires_in_days': null,
      'token': 'b3f04a3f-0a17-42a4-85f1-1376a4f07c07',
    };

void main() {
  group('Check.fromJson expires_at', () {
    test('parses the ISO8601 the server returns (6-digit microseconds)', () {
      final check = Check.fromJson(checkJson('2026-11-20T06:56:43.091034Z'));

      expect(check.expiresAt.isUtc, isTrue);
      expect(
        check.expiresAt.toUtc().toIso8601String(),
        '2026-11-20T06:56:43.091034Z',
      );
    });

    test('parses the ISO8601 the native side returns (millisecond precision '
        'zero-padded to 6 digits)', () {
      // The iOS APIJSONEncoder writes dates with the format
      // "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'", so the last three digits are
      // always 000.
      final check = Check.fromJson(checkJson('2026-11-20T06:56:43.091000Z'));

      // toIso8601String() omits trailing zeros, so compare the value itself.
      expect(
        check.expiresAt.toUtc(),
        DateTime.utc(2026, 11, 20, 6, 56, 43, 91, 0),
      );
    });

    // Regression tests: if the iOS DateFormatter is left without
    // locale = en_US_POSIX, Foundation rewrites "HH" into "h" plus an AM/PM
    // marker while the device is set to 12-hour time (Apple QA1480). The
    // expires_at that reaches Dart then stops being ISO8601 and fails here.
    // See APIJSONEncoder in ios/Classes/SwiftPokepaySdkPlugin.swift.
    //
    // The strings below are what the pre-fix APIJSONEncoder actually emitted
    // on the iOS 26.5 simulator with Settings > General > Date & Time >
    // 24-Hour Time turned off.
    test('throws FormatException for the broken date a 12-hour ja_JP device '
        'returns', () {
      // Measured: {"expires_at":"2026-11-20T午前6:56:43.091000Z", ...}
      expect(
        () => Check.fromJson(checkJson('2026-11-20T午前6:56:43.091000Z')),
        throwsA(isA<FormatException>()),
      );
    });

    test('throws FormatException for the broken date a 12-hour en_US device '
        'returns', () {
      // Measured: {"expires_at":"2026-11-20T6:56:43.091000 AMZ", ...}
      expect(
        () => Check.fromJson(checkJson('2026-11-20T6:56:43.091000 AMZ')),
        throwsA(isA<FormatException>()),
      );
    });
  });

  group('TokenInfo.fromJson (the topup QR path of getTokenInfo)', () {
    test('restores a CHECK token as a Check', () {
      final info = TokenInfo.fromJson(<String, dynamic>{
        'type': 'CHECK',
        'token': checkJson('2026-11-20T06:56:43.091034Z'),
      });

      expect(info.type, TokenType.CHECK);
      expect(info.token, isA<Check>());
      expect(
        (info.token as Check).expiresAt.toUtc().toIso8601String(),
        '2026-11-20T06:56:43.091034Z',
      );
    });

    test('throws FormatException for a CHECK token carrying a broken date', () {
      expect(
        () => TokenInfo.fromJson(<String, dynamic>{
          'type': 'CHECK',
          'token': checkJson('2026-11-20T午前6:56:43.091000Z'),
        }),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
