import 'package:meta/meta.dart';


import '../responses.dart';

part 'bill.g.dart';


class Bill extends Response {
  
  final String id;
  final double? amount;
  final String description;
  final User user;
  final PrivateMoney privateMoney;
  final bool isOnetime;
  final bool isDisabled;
  final String token;
  final double? minAmount;
  final double? maxAmount;

  Bill({
    required this.id,
    this.amount,
    required this.description,
    required this.user,
    required this.privateMoney,
    required this.isOnetime,
    required this.isDisabled,
    required this.token,
    this.minAmount,
    this.maxAmount,
  });

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);
  Map<String, dynamic> toJson() => _$BillToJson(this);
}
