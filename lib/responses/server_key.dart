import 'package:json_annotation/json_annotation.dart';

part 'server_key.g.dart';

@JsonSerializable()
class ServerKey {
  final String serverKey;

  ServerKey({
    required this.serverKey,
  });

  factory ServerKey.fromJson(Map<String, dynamic> json) => _$ServerKeyFromJson(json);

  Map<String, dynamic> toJson() => _$ServerKeyToJson(this);
}
