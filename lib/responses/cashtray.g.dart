// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashtray.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cashtray _$CashtrayFromJson(Map<String, dynamic> json) {
  return Cashtray(
    id: json['id'] as String,
    amount: (json['amount'] as num).toDouble(),
    description: json['description'] as String,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    privateMoney:
        PrivateMoney.fromJson(json['private_money'] as Map<String, dynamic>),
    expiresAt:
        const CustomDateTimeConverter().fromJson(json['expires_at'] as String),
    canceledAt:
        const CustomDateTimeConverter().fromJson(json['canceled_at'] as String),
    token: json['token'] as String,
    attempt: json['attempt'] == null
        ? null
        : CashtrayAttempt.fromJson(json['attempt'] as Map<String, dynamic>),
    transaction: json['transaction'] == null
        ? null
        : UserTransaction.fromJson(json['transaction'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CashtrayToJson(Cashtray instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'description': instance.description,
      'user': instance.user,
      'private_money': instance.privateMoney,
      'expires_at': const CustomDateTimeConverter().toJson(instance.expiresAt),
      'canceled_at':
          const CustomDateTimeConverter().toJson(instance.canceledAt),
      'token': instance.token,
      'attempt': instance.attempt,
      'transaction': instance.transaction,
    };
