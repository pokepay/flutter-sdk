import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../custom_datetime_converter.dart';
import '../responses.dart';

part 'user_transaction.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class UserTransaction extends Response {
  @JsonKey(nullable: false)
  final String id;
  @JsonKey(nullable: false)
  final String type;
  @JsonKey(nullable: false)
  final bool isModified;
  @JsonKey(nullable: false)
  final User user;
  @JsonKey(nullable: false)
  final double balance;
  @JsonKey(nullable: false)
  final double amount;
  @JsonKey(nullable: false)
  final double moneyAmount;
  @JsonKey(nullable: false)
  final double pointAmount;
  @JsonKey(nullable: false)
  final Account account;
  @JsonKey(nullable: false)
  final String description;
  @JsonKey(nullable: false)
  final DateTime doneAt;
  final double customerBalance;

  UserTransaction({
    @required this.id,
    @required this.type,
    @required this.isModified,
    @required this.user,
    @required this.balance,
    @required this.amount,
    @required this.moneyAmount,
    @required this.pointAmount,
    @required this.account,
    @required this.description,
    @required this.doneAt,
    this.customerBalance,
  });

  factory UserTransaction.fromJson(Map<String, dynamic> json) =>
      _$UserTransactionFromJson(json);
  Map<String, dynamic> toJson() => _$UserTransactionToJson(this);
}
