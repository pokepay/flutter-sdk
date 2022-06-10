// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terminal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Terminal _$TerminalFromJson(Map<String, dynamic> json) {
  return Terminal(
    id: json['id'] as String,
    name: json['name'] as String,
    hardwareId: json['hardware_id'] as String,
    pushService: json['push_service'].toString(),
    pushToken: json['push_token'].toString(),
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    account: Account.fromJson(json['account'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TerminalToJson(Terminal instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hardware_id': instance.hardwareId,
      'push_service': instance.pushService,
      'push_token': instance.pushToken,
      'user': instance.user,
      'account': instance.account,
    };
