import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../custom_datetime_converter.dart';
import '../responses.dart';

part 'check.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class Check extends Response {
  @JsonKey(nullable: false)
  final String id;
  @JsonKey(nullable: false)
  final double amount;
  @JsonKey(nullable: false)
  final double moneyAmount;
  @JsonKey(nullable: false)
  final double pointAmount;
  @JsonKey(nullable: false)
  final String description;
  @JsonKey(nullable: false)
  final User user;
  @JsonKey(nullable: false)
  final PrivateMoney privateMoney;
  @JsonKey(nullable: false)
  final bool isOnetime;
  @JsonKey(nullable: false)
  final bool isDisabled;
  @JsonKey(nullable: false)
  final DateTime expiresAt;
  @JsonKey(nullable: false)
  final String token;
  final DateTime pointExpiresAt;
  final int pointExpiresInDays;

  Check({
    @required this.id,
    @required this.amount,
    @required this.moneyAmount,
    @required this.pointAmount,
    @required this.description,
    @required this.user,
    @required this.privateMoney,
    @required this.isOnetime,
    @required this.isDisabled,
    @required this.expiresAt,
    @required this.token,
    this.pointExpiresAt,
    this.pointExpiresInDays,
  });

  factory Check.fromJson(Map<String, dynamic> json) => _$CheckFromJson(json);
  Map<String, dynamic> toJson() => _$CheckToJson(this);
}
