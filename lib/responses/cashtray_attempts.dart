
import 'package:meta/meta.dart';

import '../responses.dart';

part 'cashtray_attempts.g.dart';


class CashtrayAttempts extends Response {
  
  final List<CashtrayAttempt> rows;

  CashtrayAttempts({
    required this.rows,
  });

  factory CashtrayAttempts.fromJson(Map<String, dynamic> json) =>
      _$CashtrayAttemptsFromJson(json);
  Map<String, dynamic> toJson() => _$CashtrayAttemptsToJson(this);
}
