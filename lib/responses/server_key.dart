

import '../responses.dart';

part 'server_key.g.dart';


class ServerKey extends Response {

  final String serverKey;

  ServerKey({
    required this.serverKey,
  });

  factory ServerKey.fromJson(Map<String, dynamic> json) =>
      _$ServerKeyFromJson(json);
  Map<String, dynamic> toJson() => _$ServerKeyToJson(this);
}
