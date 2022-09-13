import 'package:json_annotation/json_annotation.dart';

import 'cashtray_attempt.dart';

part 'cashtray_attempts.g.dart';

@JsonSerializable()
class CashtrayAttempts {
  final List<CashtrayAttempt> rows;

  CashtrayAttempts({
    required this.rows,
  });

  factory CashtrayAttempts.fromJson(Map<String, dynamic> json) => _$CashtrayAttemptsFromJson(json);

  Map<String, dynamic> toJson() => _$CashtrayAttemptsToJson(this);

  @override
  String toString() => this.toJson().toString();
}
