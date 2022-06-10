
import 'package:meta/meta.dart';

import '../responses.dart';

part 'private_money.g.dart';


class PrivateMoney extends Response {
  
  final String id;
  
  final String name;
  
  final String type;
  
  final String unit;
  
  final String description;
  
  final String onelineMessage;
  final String? accountImage;
  
  final Images? images;
  
  final Organization organization;
  final double maxBalance;
  final double transferLimit;
  
  final String? expirationType;
  final bool isExclusive;
  final String? termsUrl;
  final String? privacyPolicyUrl;
  final String? paymentActUrl;
  final String? commercialActUrl;
  
  final bool? canUseCreditCard;

  PrivateMoney({
    required this.id,
    required this.name,
    required this.type,
    required this.unit,
    required this.description,
    required this.onelineMessage,
    this.accountImage,
    required this.images,
    required this.organization,
    required this.maxBalance,
    required this.transferLimit,
    required this.expirationType,
    required this.isExclusive,
    this.termsUrl,
    this.privacyPolicyUrl,
    this.paymentActUrl,
    this.commercialActUrl,
    required this.canUseCreditCard,
  });

  factory PrivateMoney.fromJson(Map<String, dynamic> json){
    return PrivateMoney(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      unit: json['unit'] as String,
      description: json['description'] as String,
      onelineMessage: json['oneline_message'] as String,
      accountImage: json['account_image'].toString(),
      images: json['images']==null?null:Images.fromJson(json['images'] as Map<String, dynamic>),
      organization:
      Organization.fromJson(json['organization'] as Map<String, dynamic>),
      maxBalance: (json['max_balance'] as num).toDouble(),
      transferLimit: (json['transfer_limit'] as num).toDouble(),
      expirationType: json['expiration_type'],
      isExclusive: json['is_exclusive'] as bool,
      termsUrl: json['terms_url'],
      privacyPolicyUrl: json['privacy_policy_url'],
      paymentActUrl: json['payment_act_url'],
      commercialActUrl: json['commercial_act_url'],
      canUseCreditCard: json['can_use_credit_card'],
    );
  }
  Map<String, dynamic> toJson() => _$PrivateMoneyToJson(this);
}
