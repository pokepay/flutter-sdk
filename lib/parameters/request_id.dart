import '../responses/error.dart';

/// A canonical RFC 4122 textual UUID in **lowercase**: 8-4-4-4-12 hex digits.
///
/// Two independent constraints force this exact shape:
///
///   * **Lowercase**, because the API only accepts lowercase `request_id`.
///     Both native SDKs already normalise on write -- Java's `UUID.toString()`
///     emits lowercase, and iOS has an explicit `pokepayRequestID` extension
///     (`uuidString.lowercased()`) because Foundation's `uuidString` is
///     uppercase. But `getTransactionByRequestId` sends the caller's string
///     through verbatim on both platforms, so an uppercase value would write
///     successfully and then be unreadable. Rejecting instead of normalising
///     keeps the caller's string byte-identical to what the server stores.
///   * **Strict 8-4-4-4-12**, because this is the intersection of the two
///     native parsers. Java's `UUID.fromString` is lenient and also accepts
///     e.g. "1-1-1-1-1"; iOS's `UUID(uuidString:)` requires the canonical
///     form. Validating to the intersection is what lets a single Dart-side
///     check keep both platforms in agreement.
final RegExp _requestIdPattern = RegExp(
    r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$');

/// Validates the optional `requestId` (idempotency key) and returns it
/// unchanged. `null` is allowed and means "no idempotency key".
///
/// Validating here rather than in the native plugins makes both platforms
/// behave identically by construction. Android's `UUID.fromString` rejects a
/// malformed value loudly, while iOS's `UUID(uuidString:)` yields nil, which
/// makes the native SDK omit `request_id` from the request body entirely --
/// the server then creates a NON-idempotent transaction, so a retry
/// double-charges the user with no error raised anywhere.
String? validateRequestId(String? requestId) {
  if (requestId == null) return null;
  if (!_requestIdPattern.hasMatch(requestId)) {
    throw ProcessingError(
      message: 'requestId must be a lowercase UUID in the 8-4-4-4-12 '
          'hexadecimal form (e.g. "550e8400-e29b-41d4-a716-446655440000"), '
          'but got "$requestId".',
    );
  }
  return requestId;
}
