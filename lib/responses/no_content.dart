import 'package:json_annotation/json_annotation.dart';

part 'no_content.g.dart';

@JsonSerializable()
class NoContent {
  NoContent();

  factory NoContent.fromJson(Map<String, dynamic> json) => _$NoContentFromJson(json);

  Map<String, dynamic> toJson() => _$NoContentToJson(this);
}
