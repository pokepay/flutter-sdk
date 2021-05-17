import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../custom_datetime_converter.dart';
import '../responses.dart';

part 'cashtray.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class Cashtray extends Response {
  @JsonKey(nullable: false)
  final String id;
  @JsonKey(nullable: false)
  final double amount;
  @JsonKey(nullable: false)
  final String description;
  @JsonKey(nullable: false)
  final User user;
  @JsonKey(nullable: false)
  final PrivateMoney privateMoney;
  @JsonKey(nullable: false)
  final DateTime expiresAt;
  final DateTime canceledAt;
  @JsonKey(nullable: false)
  final String token;
  final CashtrayAttempt attempt;
  final UserTransaction transaction;

  Cashtray({
    @required this.id,
    @required this.amount,
    @required this.description,
    @required this.user,
    @required this.privateMoney,
    @required this.expiresAt,
    this.canceledAt,
    @required this.token,
    this.attempt,
    this.transaction,
  });

  factory Cashtray.fromJson(Map<String, dynamic> json) =>
      _$CashtrayFromJson(json);
  Map<String, dynamic> toJson() => _$CashtrayToJson(this);
}
