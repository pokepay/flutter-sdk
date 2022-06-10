
import 'package:meta/meta.dart';

import '../custom_datetime_converter.dart';
import '../responses.dart';

part 'cashtray.g.dart';


@CustomDateTimeConverter()
class Cashtray extends Response {
  
  final String id;
  
  final double amount;
  
  final String description;
  
  final User user;
  
  final PrivateMoney privateMoney;
  
  final DateTime expiresAt;
  final DateTime? canceledAt;
  
  final String token;
  final CashtrayAttempt? attempt;
  final UserTransaction? transaction;

  Cashtray({
    required this.id,
    required this.amount,
    required this.description,
    required this.user,
    required this.privateMoney,
    required this.expiresAt,
    this.canceledAt,
    required this.token,
    this.attempt,
    this.transaction,
  });

  factory Cashtray.fromJson(Map<String, dynamic> json) =>
      _$CashtrayFromJson(json);
  Map<String, dynamic> toJson() => _$CashtrayToJson(this);
}
