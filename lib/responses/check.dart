
import 'package:meta/meta.dart';

import '../custom_datetime_converter.dart';
import '../responses.dart';

part 'check.g.dart';


@CustomDateTimeConverter()
class Check extends Response {
  
  final String id;
  
  final double amount;
  
  final double moneyAmount;
  
  final double pointAmount;
  
  final String description;
  
  final User user;
  
  final PrivateMoney privateMoney;
  
  final bool? isOnetime;
  
  final bool? isDisabled;
  
  final DateTime? expiresAt;
  
  final String token;
  final DateTime? pointExpiresAt;
  final int? pointExpiresInDays;

  Check({
    required this.id,
    required this.amount,
    required this.moneyAmount,
    required this.pointAmount,
    required this.description,
    required this.user,
    required this.privateMoney,
    required this.isOnetime,
    required this.isDisabled,
    required this.expiresAt,
    required this.token,
    this.pointExpiresAt,
    this.pointExpiresInDays,
  });

  factory Check.fromJson(Map<String, dynamic> json) => _$CheckFromJson(json);
  Map<String, dynamic> toJson() => _$CheckToJson(this);
}
