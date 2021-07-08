import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../custom_datetime_converter.dart';
import '../responses.dart';

part 'account.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class Account extends Response {
  @JsonKey(nullable: false)
  final String id;
  @JsonKey(nullable: false)
  final String name;
  @JsonKey(nullable: false)
  final double balance;
  @JsonKey(nullable: false)
  final double moneyBalance;
  @JsonKey(nullable: false)
  final double pointBalance;
  @JsonKey(nullable: false)
  final bool isSuspended;
  @JsonKey(nullable: false)
  final PrivateMoney privateMoney;
  final DateTime nearestExpiresAt;

  Account({
    @required this.id,
    @required this.name,
    @required this.balance,
    @required this.moneyBalance,
    @required this.pointBalance,
    @required this.isSuspended,
    @required this.privateMoney,
    this.nearestExpiresAt,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
