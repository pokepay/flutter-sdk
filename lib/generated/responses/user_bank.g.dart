// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBank _$UserBankFromJson(Map<String, dynamic> json) => UserBank(
      id: json['id'] as String,
      privateMoney:
          PrivateMoney.fromJson(json['private_money'] as Map<String, dynamic>),
      bankName: json['bank_name'] as String,
      bankCode: json['bank_code'] as String,
      branchNumber: json['branch_number'] as String,
      branchName: json['branch_name'] as String,
      depositType: json['deposit_type'] as String,
      maskedAccountNumber: json['masked_account_number'] as String,
      accountName: json['account_name'] as String,
    );

Map<String, dynamic> _$UserBankToJson(UserBank instance) => <String, dynamic>{
      'id': instance.id,
      'private_money': instance.privateMoney,
      'bank_name': instance.bankName,
      'bank_code': instance.bankCode,
      'branch_number': instance.branchNumber,
      'branch_name': instance.branchName,
      'deposit_type': instance.depositType,
      'masked_account_number': instance.maskedAccountNumber,
      'account_name': instance.accountName,
    };
