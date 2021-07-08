import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../responses.dart';

part 'cashtray_attempts.g.dart';

@JsonSerializable()
class CashtrayAttempts extends Response {
  @JsonKey(nullable: false)
  final List<CashtrayAttempt> rows;

  CashtrayAttempts({
    @required this.rows,
  });

  factory CashtrayAttempts.fromJson(Map<String, dynamic> json) =>
      _$CashtrayAttemptsFromJson(json);
  Map<String, dynamic> toJson() => _$CashtrayAttemptsToJson(this);
}
