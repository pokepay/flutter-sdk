import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String janCode;
  final String name;
  final double? unitPrice;
  final double? price;
  final bool? isDiscounted;
  final String? other;

  Product({
    required this.janCode,
    required this.name,
    this.unitPrice,
    this.price,
    this.isDiscounted,
    this.other,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  factory Product.create({
    required String janCodePrimary,
    required String janCodeSecondary,
    required String name,
    double? unitPrice,
    double? price,
    bool isDiscounted = false,
    required double amount,
    required String amountUnit,
  }) {
    String janCode = janCodePrimary;
    janCode += "___" + janCodeSecondary;
    Product product = Product(
      janCode: janCode,
      name: name,
      unitPrice: unitPrice,
      price: price,
      isDiscounted: isDiscounted,
      other: jsonEncode({
        "amount": amount,
        "amount_unit": amountUnit,
      }),
    );
    return product;
  }
}
