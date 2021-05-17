import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../custom_datetime_converter.dart';
import '../responses.dart';

part 'cashtray_attempt.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class CashtrayAttempt extends Response {
  @JsonKey(nullable: false)
  final User user;
  final Account account;
  @JsonKey(nullable: false)
  final int statusCode;
  final String errorType;
  final String errorMessage;
  @JsonKey(nullable: false)
  final DateTime createdAt;

  CashtrayAttempt({
    @required this.user,
    this.account,
    @required this.statusCode,
    this.errorType,
    this.errorMessage,
    @required this.createdAt,
  });

  factory CashtrayAttempt.fromJson(Map<String, dynamic> json) =>
      _$CashtrayAttemptFromJson(json);
  Map<String, dynamic> toJson() => _$CashtrayAttemptToJson(this);
}
