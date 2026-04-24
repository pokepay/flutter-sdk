// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seven_atm_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SevenAtmSession _$SevenAtmSessionFromJson(Map<String, dynamic> json) =>
    SevenAtmSession(
      qrInfo: json['qr_info'] as String,
      amount: (json['amount'] as num).toDouble(),
      account: Account.fromJson(json['account'] as Map<String, dynamic>),
      transaction: json['transaction'] == null
          ? null
          : UserTransaction.fromJson(
              json['transaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SevenAtmSessionToJson(SevenAtmSession instance) =>
    <String, dynamic>{
      'qr_info': instance.qrInfo,
      'amount': instance.amount,
      'account': instance.account,
      'transaction': instance.transaction,
    };
