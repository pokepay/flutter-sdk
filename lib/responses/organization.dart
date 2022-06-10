
import 'package:meta/meta.dart';

import '../responses.dart';

part 'organization.g.dart';


class Organization extends Response {
  
  final String code;
  
  final String name;

  Organization({
    required this.code,
    required this.name,
  });

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
