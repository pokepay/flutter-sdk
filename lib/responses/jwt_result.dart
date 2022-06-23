import 'package:json_annotation/json_annotation.dart';

part 'jwt_result.g.dart';

@JsonSerializable()
class JwtResult {
  final String data;
  final String error;

  JwtResult({
    required this.data,
    required this.error,
  });

  factory JwtResult.fromJson(Map<String, dynamic> json) => _$JwtResultFromJson(json);
  Map<String, dynamic> toJson() => _$JwtResultToJson(this);
}