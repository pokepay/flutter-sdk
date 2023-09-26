// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bankpay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankPay _$BankPayFromJson(Map<String, dynamic> json) => BankPay(
      id: json['id'] as String,
      bankName: json['bank_name'] as String,
      bankCode: json['bank_code'] as String,
      branchNumber: json['branch_number'] as String,
      branchName: json['branch_name'] as String,
      depositType: json['deposit_type'] as int,
      maskedAccountNumber: json['masked_account_number'] as String,
      accountName: json['account_name'] as String,
      privateMoneyId: json['private_money_id'] as String?,
    );

Map<String, dynamic> _$BankPayToJson(BankPay instance) => <String, dynamic>{
      'id': instance.id,
      'bank_name': instance.bankName,
      'bank_code': instance.bankCode,
      'branch_number': instance.branchNumber,
      'branch_name': instance.branchName,
      'deposit_type': instance.depositType,
      'masked_account_number': instance.maskedAccountNumber,
      'account_name': instance.accountName,
      'private_money_id': instance.privateMoneyId,
    };
