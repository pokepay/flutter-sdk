import 'package:json_annotation/json_annotation.dart';

import '../responses.dart';

part 'server_key.g.dart';

@JsonSerializable()
class ServerKey extends Response {
  @JsonKey(nullable: false)
  final String serverKey;

  ServerKey({
    this.serverKey,
  });

  factory ServerKey.fromJson(Map<String, dynamic> json) =>
      _$ServerKeyFromJson(json);
  Map<String, dynamic> toJson() => _$ServerKeyToJson(this);
}
