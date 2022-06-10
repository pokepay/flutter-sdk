

import '../responses.dart';

part 'no_content.g.dart';


class NoContent extends Response {
  NoContent();

  factory NoContent.fromJson(Map<String, dynamic> json) =>
      _$NoContentFromJson(json);
  Map<String, dynamic> toJson() => _$NoContentToJson(this);
}
