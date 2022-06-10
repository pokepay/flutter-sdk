
import 'package:meta/meta.dart';

import '../custom_datetime_converter.dart';
import '../responses.dart';

part 'user_transaction.g.dart';


@CustomDateTimeConverter()
class UserTransaction extends Response {
  
  final String id;
  
  final String type;
  
  final bool isModified;
  
  final User user;
  
  final double balance;
  
  final double amount;
  
  final double moneyAmount;
  
  final double pointAmount;
  
  final Account account;
  
  final String description;
  
  final DateTime doneAt;
  final double? customerBalance;

  UserTransaction({
    required this.id,
    required this.type,
    required this.isModified,
    required this.user,
    required this.balance,
    required this.amount,
    required this.moneyAmount,
    required this.pointAmount,
    required this.account,
    required this.description,
    required this.doneAt,
    this.customerBalance,
  });

  factory UserTransaction.fromJson(Map<String, dynamic> json) =>
      _$UserTransactionFromJson(json);
  Map<String, dynamic> toJson() => _$UserTransactionToJson(this);
}
