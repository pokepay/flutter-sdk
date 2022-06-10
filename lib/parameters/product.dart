import 'dart:convert';
part 'product.g.dart';


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

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  factory Product.create({
    required String janCodePrimary,
    String? janCodeSecondary,
    required String name,
    double? unitPrice,
    double? price,
    bool? isDiscounted = false,
    double? amount,
    String? amountUnit,
  }) {
    String janCode = janCodePrimary;
    if (janCodeSecondary != null) {
      janCode += "___" + janCodeSecondary;
    }
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
