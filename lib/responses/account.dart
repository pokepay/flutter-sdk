import 'package:meta/meta.dart';

import '../custom_datetime_converter.dart';
import '../responses.dart';




@CustomDateTimeConverter()
class Account extends Response {

  String? id;

  String? name;

  double? balance;

  double? moneyBalance;

  double? pointBalance;

  bool? isSuspended;

  PrivateMoney? privateMoney;
  DateTime? nearestExpiresAt;

  Account({
    this.id,
    this.name,
    this.balance,
    this.moneyBalance,
    this.pointBalance,
    this.isSuspended,
    this.privateMoney,
    this.nearestExpiresAt,
  });

  Account.fromJson(Map<String, dynamic> json){
    id = json['id'] as String;
    name = json['name'] as String;
    balance = json['balance']==null?null:(json['balance'] as num).toDouble();
    moneyBalance = json['money_balance']==null?null: (json['money_balance'] as num).toDouble();
    pointBalance = json['point_balance']==null?null: (json['point_balance'] as num).toDouble();
    isSuspended = json['is_suspended'] as bool;
    privateMoney = json['private_money'] ==null?null:PrivateMoney.fromJson(json['private_money'] as Map<String, dynamic>);
    nearestExpiresAt = json['nearest_expires_at']==null?null:const CustomDateTimeConverter().fromJson(json['nearest_expires_at'].toString());
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'balance': balance,
      'money_balance': moneyBalance,
      'point_balance': pointBalance,
      'is_suspended': isSuspended,
      'private_money': privateMoney,
      'nearest_expires_at':
      const CustomDateTimeConverter().toJson(nearestExpiresAt),
    };
  }


}
