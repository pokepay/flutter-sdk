import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../responses.dart';

part 'terminal.g.dart';

@JsonSerializable()
class Terminal extends Response {
  @JsonKey(nullable: false)
  final String id;
  @JsonKey(nullable: false)
  final String name;
  @JsonKey(nullable: false)
  final String hardwareId;
  final String pushService;
  final String pushToken;
  @JsonKey(nullable: false)
  final User user;
  @JsonKey(nullable: false)
  final Account account;

  Terminal({
    @required this.id,
    @required this.name,
    @required this.hardwareId,
    this.pushService,
    this.pushToken,
    @required this.user,
    @required this.account,
  });

  factory Terminal.fromJson(Map<String, dynamic> json) =>
      _$TerminalFromJson(json);
  Map<String, dynamic> toJson() => _$TerminalToJson(this);
}
