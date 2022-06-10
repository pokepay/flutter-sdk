
import 'package:meta/meta.dart';

import '../custom_datetime_converter.dart';
import '../responses.dart';

part 'cashtray_attempt.g.dart';


@CustomDateTimeConverter()
class CashtrayAttempt extends Response {
  
  final User user;
  final Account? account;
  
  final int statusCode;
  final String? errorType;
  final String? errorMessage;
  
  final DateTime createdAt;

  CashtrayAttempt({
    required this.user,
    this.account,
    required this.statusCode,
    this.errorType,
    this.errorMessage,
    required this.createdAt,
  });

  factory CashtrayAttempt.fromJson(Map<String, dynamic> json) =>
      _$CashtrayAttemptFromJson(json);
  Map<String, dynamic> toJson() => _$CashtrayAttemptToJson(this);
}
