import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../responses.dart';

part 'private_money.g.dart';

@JsonSerializable()
class PrivateMoney extends Response {
  @JsonKey(nullable: false)
  final String id;
  @JsonKey(nullable: false)
  final String name;
  @JsonKey(nullable: false)
  final String type;
  @JsonKey(nullable: false)
  final String unit;
  @JsonKey(nullable: false)
  final String description;
  @JsonKey(nullable: false)
  final String onelineMessage;
  final String accountImage;
  @JsonKey(nullable: false)
  final Images images;
  @JsonKey(nullable: false)
  final Organization organization;
  final double maxBalance;
  final double transferLimit;
  @JsonKey(nullable: false)
  final String expirationType;
  final bool isExclusive;
  final String termsUrl;
  final String privacyPolicyUrl;
  final String paymentActUrl;
  final String commercialActUrl;
  @JsonKey(nullable: false)
  final bool canUseCreditCard;

  PrivateMoney({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.unit,
    @required this.description,
    @required this.onelineMessage,
    this.accountImage,
    @required this.images,
    @required this.organization,
    @required this.maxBalance,
    @required this.transferLimit,
    @required this.expirationType,
    @required this.isExclusive,
    this.termsUrl,
    this.privacyPolicyUrl,
    this.paymentActUrl,
    this.commercialActUrl,
    @required this.canUseCreditCard,
  });

  factory PrivateMoney.fromJson(Map<String, dynamic> json) =>
      _$PrivateMoneyFromJson(json);
  Map<String, dynamic> toJson() => _$PrivateMoneyToJson(this);
}
