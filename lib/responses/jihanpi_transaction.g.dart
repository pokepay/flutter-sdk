// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jihanpi_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JihanpiTransaction _$JihanpiTransactionFromJson(Map<String, dynamic> json) =>
    JihanpiTransaction(
      orderId: json['order_id'] as String,
      transaction: json['transaction'] == null
          ? null
          : UserTransactionWithTransfers.fromJson(
              json['transaction'] as Map<String, dynamic>),
      account: Account.fromJson(json['account'] as Map<String, dynamic>),
      vendingMachineInfo: JihanpiVendingMachine.fromJson(
          json['vending_machine_info'] as Map<String, dynamic>),
      state: json['state'] as String,
      errorReason: json['error_reason'] as String?,
      strategy: json['strategy'] as String,
    );

Map<String, dynamic> _$JihanpiTransactionToJson(JihanpiTransaction instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'transaction': instance.transaction,
      'account': instance.account,
      'vending_machine_info': instance.vendingMachineInfo,
      'state': instance.state,
      'error_reason': instance.errorReason,
      'strategy': instance.strategy,
    };
