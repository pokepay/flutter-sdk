// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_cpm_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountCpmToken _$AccountCpmTokenFromJson(Map<String, dynamic> json) {
  return AccountCpmToken(
    cpmToken: json['cpm_token'] as String,
    account: Account.fromJson(json['account'] as Map<String, dynamic>),
    transaction: json['transaction'] == null
        ? null
        : UserTransaction.fromJson(json['transaction'] as Map<String, dynamic>),
    scopes: (json['scopes'] as List).map((e) => e as String).toList(),
    expiresAt:
        const CustomDateTimeConverter().fromJson(json['expires_at'] as String),
    metadata: json['metadata'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$AccountCpmTokenToJson(AccountCpmToken instance) =>
    <String, dynamic>{
      'cpm_token': instance.cpmToken,
      'account': instance.account,
      'transaction': instance.transaction,
      'scopes': instance.scopes,
      'expires_at': const CustomDateTimeConverter().toJson(instance.expiresAt),
      'metadata': instance.metadata,
    };
