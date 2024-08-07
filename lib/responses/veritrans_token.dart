import 'package:json_annotation/json_annotation.dart';

part 'veritrans_token.g.dart';

@JsonSerializable()
class VeritransToken {
  final String token;

  VeritransToken({
    required this.token,
  });

  factory VeritransToken.fromJson(Map<String, dynamic> json) => _$VeritransTokenFromJson(json);

  Map<String, dynamic> toJson() => _$VeritransTokenToJson(this);

  @override
  String toString() => this.toJson().toString();
}
