import 'package:json_annotation/json_annotation.dart';

import 'credit_card.dart';

part 'paginated_credit_cards.g.dart';

@JsonSerializable()
class PaginatedCreditCards {
  final int? perPage;
  final int? count;
  final String? next;
  final String? prev;
  final List<CreditCard> items;

  PaginatedCreditCards({
    this.perPage,
    this.count,
    this.next,
    this.prev,
    required this.items,
  });

  factory PaginatedCreditCards.fromJson(Map<String, dynamic> json) => _$PaginatedCreditCardsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedCreditCardsToJson(this);

  @override
  String toString() => this.toJson().toString();
}
