// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cpm_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CpmToken _$CpmTokenFromJson(Map<String, dynamic> json) => CpmToken(
      cpmToken: json['cpm_token'] as String,
      account: Account.fromJson(json['account'] as Map<String, dynamic>),
      transaction: json['transaction'] == null
          ? null
          : UserTransactionWithTransfers.fromJson(
              json['transaction'] as Map<String, dynamic>),
      scopes:
          (json['scopes'] as List<dynamic>).map((e) => e as String).toList(),
      expiresAt: DateTime.parse(json['expires_at'] as String),
      metadata: json['metadata'] as Map<String, dynamic>,
      strategy: json['strategy'] as String?,
      couponId: json['coupon_id'] as String?,
    );

Map<String, dynamic> _$CpmTokenToJson(CpmToken instance) => <String, dynamic>{
      'cpm_token': instance.cpmToken,
      'account': instance.account,
      'transaction': instance.transaction,
      'scopes': instance.scopes,
      'expires_at': instance.expiresAt.toIso8601String(),
      'metadata': instance.metadata,
      'strategy': instance.strategy,
      'coupon_id': instance.couponId,
    };
