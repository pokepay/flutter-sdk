// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tag_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTagInformation _$UserTagInformationFromJson(Map<String, dynamic> json) =>
    UserTagInformation(
      groupName: json['group_name'] as String,
      itemNames: (json['item_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserTagInformationToJson(UserTagInformation instance) =>
    <String, dynamic>{
      'group_name': instance.groupName,
      'item_names': instance.itemNames,
    };
