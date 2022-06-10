

import '../responses.dart';

part 'jwt_result.g.dart';


class JwtResult extends Response {
  final String? data;
  final String? error;

  JwtResult({
    this.data,
    this.error,
  });

  factory JwtResult.fromJson(Map<String, dynamic> json) =>
      _$JwtResultFromJson(json);
  Map<String, dynamic> toJson() => _$JwtResultToJson(this);
}
