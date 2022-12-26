// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terminal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Terminal _$TerminalFromJson(Map<String, dynamic> json) => Terminal(
      id: json['id'] as String,
      name: json['name'] as String,
      hardwareId: json['hardware_id'] as String,
      pushService: json['push_service'] as String?,
      pushToken: json['push_token'] as String?,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      account: Account.fromJson(json['account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TerminalToJson(Terminal instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hardware_id': instance.hardwareId,
      'push_service': instance.pushService,
      'push_token': instance.pushToken,
      'user': instance.user.toJson(),
      'account': instance.account.toJson(),
    };
