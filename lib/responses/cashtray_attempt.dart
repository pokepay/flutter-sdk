import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_flutter_sdk/responses/user.dart';

import '../custom_datetime_converter.dart';
import 'account.dart';

part 'cashtray_attempt.g.dart';

@JsonSerializable()
class CashtrayAttempt {
  final User user;
  final Account? account;
  final int statusCode;
  final String errorType;
  final String errorMessage;
  final DateTime createdAt;

  CashtrayAttempt({
    required this.user,
    this.account,
    required this.statusCode,
    required this.errorType,
    required this.errorMessage,
    required this.createdAt,
  });

  factory CashtrayAttempt.fromJson(Map<String, dynamic> json) => _$CashtrayAttemptFromJson(json);

  Map<String, dynamic> toJson() => _$CashtrayAttemptToJson(this);
}
