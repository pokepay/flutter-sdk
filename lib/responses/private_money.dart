import 'package:json_annotation/json_annotation.dart';

import 'images.dart';
import 'organization.dart';

part 'private_money.g.dart';

@JsonSerializable()
class PrivateMoney {
  final String id;
  final String name;
  final String type;
  final String unit;
  final String description;
  final String onlineMessage;
  final String? accountImage;
  final Images images;
  final Organization organization;
  final double? maxBalance;
  final double? transferLimit;
  final String expirationType;
  final bool? isExclusive;
  final String? termsUrl;
  final String? privacyPolicyUrl;
  final String? paymentActUrl;
  final String? commercialActUrl;
  final bool canUseCreditCard;
  final String? customDomainName;

  PrivateMoney({
    required this.id,
    required this.name,
    required this.type,
    required this.unit,
    required this.description,
    required this.onlineMessage,
    this.accountImage,
    required this.images,
    required this.organization,
    this.maxBalance,
    this.transferLimit,
    required this.expirationType,
    this.isExclusive,
    this.termsUrl,
    this.privacyPolicyUrl,
    this.paymentActUrl,
    this.commercialActUrl,
    required this.canUseCreditCard,
    this.customDomainName,
  });

  factory PrivateMoney.fromJson(Map<String, dynamic> json) => _$PrivateMoneyFromJson(json);

  Map<String, dynamic> toJson() => _$PrivateMoneyToJson(this);

  @override
  String toString() => this.toJson().toString();
}
