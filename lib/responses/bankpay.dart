import 'package:json_annotation/json_annotation.dart';

part 'bankpay.g.dart';

@JsonSerializable()
class BankPay {
  final String id;
  final String bankName;
  final String bankCode;
  final String branchNumber;
  final String branchName;
  final String depositType;
  final String maskedAccountNumber;
  final String accountName;
  final String? privateMoneyId;

  BankPay({
    required this.id,
    required this.bankName,
    required this.bankCode,
    required this.branchNumber,
    required this.branchName,
    required this.depositType,
    required this.maskedAccountNumber,
    required this.accountName,
    this.privateMoneyId
  });

  factory BankPay.fromJson(Map<String, dynamic> json) =>
      _$BankPayFromJson(json);

  Map<String, dynamic> toJson() => _$BankPayToJson(this);

  @override
  String toString() => this.toJson().toString();
}