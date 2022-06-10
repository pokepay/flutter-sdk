// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    janCode: json['jan_code'] as String,
    name: json['name'] as String,
    unitPrice: (json['unit_price'] as num).toDouble(),
    price: (json['price'] as num).toDouble(),
    isDiscounted: json['is_discounted'] as bool,
    other: json['other'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'jan_code': instance.janCode,
      'name': instance.name,
      'unit_price': instance.unitPrice,
      'price': instance.price,
      'is_discounted': instance.isDiscounted,
      'other': instance.other,
    };
