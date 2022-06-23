// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageAttachment _$MessageAttachmentFromJson(Map<String, dynamic> json) {
  return MessageAttachment(
    moneyAmount: (json['money_amount'] as num).toDouble(),
    pointAmount: (json['point_amount'] as num).toDouble(),
    privateMoney:
        json['private_money'] == null ? null : PrivateMoney.fromJson(json['private_money'] as Map<String, dynamic>),
    isReceived: json['is_received'] as bool,
    expiresAt: const CustomDateTimeConverter().fromJson(json['expires_at'] as String),
  );
}

Map<String, dynamic> _$MessageAttachmentToJson(MessageAttachment instance) => <String, dynamic>{
      'money_amount': instance.moneyAmount,
      'point_amount': instance.pointAmount,
      'private_money': instance.privateMoney,
      'is_received': instance.isReceived,
      if (instance.expiresAt != null) 'expires_at': const CustomDateTimeConverter().toJson(instance.expiresAt!),
    };
