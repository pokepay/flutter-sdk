import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../responses.dart';

part 'organization.g.dart';

@JsonSerializable()
class Organization extends Response {
  @JsonKey(nullable: false)
  final String code;
  @JsonKey(nullable: false)
  final String name;

  Organization({
    @required this.code,
    @required this.name,
  });

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
