import '../responses/error.dart';

/// A canonical RFC 4122 textual UUID: 8-4-4-4-12 hexadecimal digits.
///
/// This is deliberately the *strict* form that iOS's `UUID(uuidString:)`
/// accepts, not the lenient form Java's `UUID.fromString` accepts (which also
/// takes e.g. "1-1-1-1-1"). Validating against the intersection of the two is
/// what lets a single Dart-side check keep both platforms in agreement.
final RegExp _requestIdPattern = RegExp(
    r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$');

/// Validates the optional `requestId` (idempotency key) and returns it
/// unchanged. `null` is allowed and means "no idempotency key".
///
/// Validating here rather than in the native plugins makes both platforms
/// behave identically by construction. Android's `UUID.fromString` rejects a
/// malformed value loudly, while iOS's `UUID(uuidString:)` yields nil, which
/// makes the native SDK omit `request_id` from the request body entirely --
/// the server then creates a NON-idempotent transaction, so a retry
/// double-charges the user with no error raised anywhere.
///
/// The value is never normalised: both native parsers and the server are
/// case-insensitive, and silently rewriting an idempotency key would be the
/// same class of bug this guards against.
String? validateRequestId(String? requestId) {
  if (requestId == null) return null;
  if (!_requestIdPattern.hasMatch(requestId)) {
    throw ProcessingError(
      message: 'requestId must be a UUID in the 8-4-4-4-12 hexadecimal form '
          '(e.g. "550e8400-e29b-41d4-a716-446655440000"), '
          'but got "$requestId".',
    );
  }
  return requestId;
}
