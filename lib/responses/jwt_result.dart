import 'package:json_annotation/json_annotation.dart';

import '../responses.dart';

part 'jwt_result.g.dart';

@JsonSerializable()
class JwtResult extends Response {
  final String data;
  final String error;

  JwtResult({
    this.data,
    this.error,
  });

  factory JwtResult.fromJson(Map<String, dynamic> json) =>
      _$JwtResultFromJson(json);
  Map<String, dynamic> toJson() => _$JwtResultToJson(this);
}
