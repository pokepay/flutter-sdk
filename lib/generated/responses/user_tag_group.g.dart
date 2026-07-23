// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tag_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTagGroup _$UserTagGroupFromJson(Map<String, dynamic> json) => UserTagGroup(
      groupName: json['group_name'] as String,
      id: json['id'] as String,
      hasSubgroups: json['has_subgroups'] as bool,
    );

Map<String, dynamic> _$UserTagGroupToJson(UserTagGroup instance) =>
    <String, dynamic>{
      'group_name': instance.groupName,
      'id': instance.id,
      'has_subgroups': instance.hasSubgroups,
    };
