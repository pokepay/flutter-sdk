import 'package:json_annotation/json_annotation.dart';

import '../responses.dart';

part 'no_content.g.dart';

@JsonSerializable()
class NoContent extends Response {
  NoContent();

  factory NoContent.fromJson(Map<String, dynamic> json) =>
      _$NoContentFromJson(json);
  Map<String, dynamic> toJson() => _$NoContentToJson(this);
}
