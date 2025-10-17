import 'package:json_annotation/json_annotation.dart';
part 'user_transfer_without_account.g.dart';

@JsonSerializable()
class UserTransferWithoutAccount {
  final String id;
  final String type;
  final double? amount;
  final String description;
  final String doneAt;
  final double? moneyAmount;
  final double? pointAmount;

  UserTransferWithoutAccount({
    required this.id,
    required this.type,
    this.amount,
    required this.description,
    required this.doneAt,
    this.moneyAmount,
    this.pointAmount,
  });

  factory UserTransferWithoutAccount.fromJson(Map<String, dynamic> json) =>
      _$UserTransferWithoutAccountFromJson(json);

  Map<String, dynamic> toJson() => _$UserTransferWithoutAccountToJson(this);

  @override
  String toString() => this.toJson().toString();
}
