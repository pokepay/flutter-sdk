import 'package:json_annotation/json_annotation.dart';

part 'credit_card.g.dart';

@JsonSerializable()
class CreditCard {
  final String cardNumber;
  final String registeredAt;

  CreditCard({
    required this.cardNumber,
    required this.registeredAt,
  });

  factory CreditCard.fromJson(Map<String, dynamic> json) => _$CreditCardFromJson(json);

  Map<String, dynamic> toJson() => _$CreditCardToJson(this);

  @override
  String toString() => this.toJson().toString();
}
