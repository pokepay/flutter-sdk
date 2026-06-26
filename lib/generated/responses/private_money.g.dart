// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_money.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivateMoney _$PrivateMoneyFromJson(Map<String, dynamic> json) => PrivateMoney(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      unit: json['unit'] as String,
      description: json['description'] as String,
      onelineMessage: json['oneline_message'] as String,
      displayMoneyAndPoint: json['display_money_and_point'] as String,
      accountImage: json['account_image'] as String,
      images:
          PrivateMoneyImages.fromJson(json['images'] as Map<String, dynamic>),
      organization:
          Organization.fromJson(json['organization'] as Map<String, dynamic>),
      maxBalance: (json['max_balance'] as num).toDouble(),
      transferLimit: (json['transfer_limit'] as num).toDouble(),
      expirationType: json['expiration_type'] as String,
      isExclusive: json['is_exclusive'] as bool,
      termsUrl: json['terms_url'] as String?,
      privacyPolicyUrl: json['privacy_policy_url'] as String?,
      paymentActUrl: json['payment_act_url'] as String?,
      commercialActUrl: json['commercial_act_url'] as String?,
      isTopupQuotaAvailable: json['is_topup_quota_available'] as bool,
      isItrustAuthenticationEnabled:
          json['is_itrust_authentication_enabled'] as bool,
    );

Map<String, dynamic> _$PrivateMoneyToJson(PrivateMoney instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'unit': instance.unit,
      'description': instance.description,
      'oneline_message': instance.onelineMessage,
      'display_money_and_point': instance.displayMoneyAndPoint,
      'account_image': instance.accountImage,
      'images': instance.images,
      'organization': instance.organization,
      'max_balance': instance.maxBalance,
      'transfer_limit': instance.transferLimit,
      'expiration_type': instance.expirationType,
      'is_exclusive': instance.isExclusive,
      'terms_url': instance.termsUrl,
      'privacy_policy_url': instance.privacyPolicyUrl,
      'payment_act_url': instance.paymentActUrl,
      'commercial_act_url': instance.commercialActUrl,
      'is_topup_quota_available': instance.isTopupQuotaAvailable,
      'is_itrust_authentication_enabled':
          instance.isItrustAuthenticationEnabled,
    };
